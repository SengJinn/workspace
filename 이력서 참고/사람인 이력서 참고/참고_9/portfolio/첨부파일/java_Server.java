package yyg.rere.server;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import yyg.rere.DB.DB;

class Pair {
	private Socket socket;
	private int num;
	
	public Pair(Socket socket) {
		this.socket = socket;
		this.num = 0;
	}
	public Pair(Socket socket, int num) {
		this.socket = socket;
		this.num = num;
	}
	public Socket getSocket() {
		return socket;
	}
	public void setS(Socket socket) {
		this.socket = socket;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}

class Pair2 {
	private int server_num;
	private int db_num;
	
	Pair2(int a, int b) {
		server_num = a;
		db_num = b;
	}

	public int getDb_num() {
		return db_num;
	}

	public void setDb_num(int db_num) {
		this.db_num = db_num;
	}

	public int getServer_num() {
		return server_num;
	}

	public void setServer_num(int server_num) {
		this.server_num = server_num;
	}
}

public class Server {

	private static int r_count = 0;
	private static int u_count = 0;
	private static boolean running = true;
	static ServerSocket serverSocket;
	static HashMap<Integer, Pair> online = new HashMap<>();				// online user
	static HashMap<Integer, ArrayList<Integer>> rooms = new HashMap<>();	// room control
	static ArrayList<Pair2> online_num = new ArrayList<>();
	// public static void main(String [] args)
	// private static void stopServer()
	// private static synchronized void addClient()
	// private static synchronized void delClient(int num, int option)
	// private static void receive(int s_num, Socket socket)
	// private static void send(int request, int option, String message, OutputStream os)
	
	public static void main(String [] args) {
		try {
			serverSocket = new ServerSocket();
/**********/serverSocket.bind(new InetSocketAddress("192.168.1.41", 5001));/**********/
			System.out.println("-Server open");
			
			Thread t = new Thread(() -> {
				while (running) {addClient();}
			});
			t.start();
		} catch (IOException e) {
			System.out.println("-Server open fail : " + e.getMessage());
			stopServer();
			return;
		}
	}
	
	private static void stopServer() {
		System.out.println("-Server Boom!");
		try {
			for (int a : online.keySet()) {
				// what order?
				online.get(a).getSocket().close();		
				online.remove(a);
			}
			if(serverSocket != null && !serverSocket.isClosed()) {
				serverSocket.close();
			}
		} catch (IOException e) {System.out.println("-Boom fail");}
	}
	
	private static synchronized void addClient() {
		System.out.println("-Client Waiting");
		try {
			Socket socket = null;
			socket = serverSocket.accept();
			if (socket != null) {
				int s_num = u_count;
				online.put(u_count++, new Pair(socket));
				System.out.println("[client" + s_num + "] accepted");
				
				receive(s_num, socket);
			}
			else {
				return;
			}
		} catch (IOException e) {
			System.out.println("-'addClient' STOP: " + e.getMessage());
		}
	}
	
	
	
	private static synchronized void delClient(int num, int option) {
		System.out.println("[client" + num + "] in 'delClient'");
		
		// get out from whole rooms
		whole:
		for (int a : rooms.keySet()) {
			for (int b = 0; b < rooms.get(a).size(); b++) {
				if (rooms.get(a).get(b) == num) {rooms.get(a).remove(b);}
				if (rooms.get(a).size() == 0)	{rooms.remove(a);}
				break whole;
			}
		}
		
		// log out
		int db_num = online.get(num).getNum();
		for (int a = 0; a < online_num.size(); a++) {
			if (db_num == online_num.get(a).getDb_num()) {
				online_num.remove(db_num);
				break;
			}
		}
	
		if (option == 0) {return;}
		
		// break socket connection
		try {
			online.get(num).getSocket().close();
		} catch (IOException e) {
			System.out.println("-'delClient' error removing socket: " + e.toString());
		}
		online.remove(num);
	}
	
	private static void receive(int s_num, Socket socket) {
		System.out.println("[client" + s_num + "] in 'receive'");
			
		Thread t = new Thread(() -> {
			OutputStream os = null;
			
			try {os = socket.getOutputStream();} 
			catch (IOException e2) {System.out.println("[client" + s_num + "] 'receive' getOutputStream error: " + e2.toString());}
			
			// admit socket connection
			send(0, -1, Integer.toString(s_num), os);
			
			while(true) {
				try {
					byte[] bytes = new byte[1000];
					InputStream is = socket.getInputStream();					
					
					// Read
					int readByte = is.read(bytes);
					String data = new String(bytes, 0, readByte, "UTF-8");
					
					// Tokenize
					StringTokenizer st = new StringTokenizer(data, "|");
					int request = Integer.parseInt(st.nextToken());
					int option = Integer.parseInt(st.nextToken());
					
					// Refine message
					String message = "";
					int count = 0;
					while(st.hasMoreTokens()) {
						if (count != 0) message += "|";
						count++;
						message += st.nextToken();
					}
					
					System.out.println("[client" + s_num + "] -> " + request + "|" + option + "|" + message);
					
					switch(request) {	// request|option|message
					
						case 0: // join
							if (option == 1) {
								String id = message;
								boolean exist = DB.existInTable(id, "member_list");
								if (exist) send(0, 1, "0", os);
								else send(0, 1, "1", os);
								System.out.println("[client" + s_num + "] ID permission: " + !exist);								
							}
							else {
								String[] infos = message.split(",");
								System.out.print("ID: " + infos[0]);
								System.out.print(" / PW: " + infos[1]);
								System.out.println(" / Nick: " + infos[2]);
								DB.join(infos[0], infos[1], infos[2]);
								System.out.println("[client" + s_num + "] registered");
							}
							break;
							
							
							
						case 1:	// login	////////////////////////- double access?
							String[] login = message.split(",");
							
							
							
							boolean isOk = DB.login(login[0], login[1]);
							System.out.println("[client" + s_num + "] ID: " + login[0] + " login permission: " + isOk);
							
							if(isOk) {
								send(1, -1, "1", os);
								online.get(s_num).setNum(DB.getterNum(login[0]));
								online_num.add(new Pair2(s_num, online.get(s_num).getNum()));
							}
							else	  send(1, -1, "0", os);
//
							message = "";
							for (int b = 0; b < online_num.size(); b++) {
								message += DB.getterNnI(online_num.get(b).getDb_num());
								message += ",";
							}
	
							for (int a = 0; a < online_num.size(); a++) {
								Socket s = online.get(online_num.get(a).getServer_num()).getSocket();
								OutputStream outputstream = s.getOutputStream();
								send(7, -1, message, outputstream);
							}

							break;
							
							
							
							
						case 2: // make a room and enter
							int temp = r_count++;
							rooms.put(temp, new ArrayList<Integer>());
							DB.setRoom(temp, message);
							rooms.get(temp).add(s_num);
							System.out.println("[client" + s_num + "] make room" + temp);
							break;
							
							
							
						case 3: // enter the room			[option]
							if (rooms.containsKey(option)) {
								rooms.get(option).add(s_num);								
//								send(socket, x, y, "1", os);
								System.out.println("[client" + s_num + "] enter room" + option);
							}
							else {
//								send(socket, x, y, "0", os);
								System.out.println("[client" + s_num + "] access room" + option + "which doesn't exist");
							}

							break;
							
							
							
						case 4: // room out					[option]
							rooms.get(option).remove(s_num);
							System.out.println("[client" + s_num + "] leave room" + option);
							if (rooms.get(option).size() == 0)	{
								rooms.remove(option);
								DB.delRoom(option);
								System.out.println("-room" + option + " removed");
							}
							
							break;
							
							
							
							
						case 5: // message to the room		[option]
							Socket temp_socket;
							for (int a = 0; a < rooms.get(option).size(); a++) {
								temp_socket = online.get(rooms.get(option).get(a)).getSocket();
								OutputStream outputstream = temp_socket.getOutputStream();
								send(2, option, message, outputstream);		
							}
							System.out.println("[client" + s_num + "] send message to room" + option);
							break;
							
							
							
						case 6: // logout
							delClient(s_num, 0);
							System.out.println("[client" + s_num + "] logout");
							break;
							
							
							
						case 7: // user
							message = "";
							for (int a = 0; a < online_num.size(); a++) {
								message += DB.getterNnI(online_num.get(a).getDb_num());
								message += ",";
							}

							send(7, -1, message, os);
							System.out.println("[client" + s_num + "] request user_list");
							break;
							
							
							
							
						case 8: // room
							message = "";
							for (int a : rooms.keySet()) {
								message += DB.getterRoomName(a);
								message += ",";
							}
							if(!message.equals("")) {
								send(8, -1, message, os);								
							}
							System.out.println("[client" + s_num + "] request room_list");
							break;	
						default:
							break;
					}
					
					
					
				} catch (Exception e) {
					try {
						os.close();
					} catch (IOException e1) {
						System.out.println("-[client" + s_num + "] os.close() IOException: " + e.toString());
					}
					delClient(s_num, 1);
					System.out.println("-'receive' Error : " + e.toString());
					break;
				}
			}				
		});
		t.start();
	}
	
	private static void send(int request, int option, String message, OutputStream os) {
		System.out.println("-'send' <- " + request + "|" + option + "|" + message);
		
		try {
			String refined = request + "|" + option + "|" + message;
			byte[] bytes = refined.getBytes("UTF-8");
			os.write(bytes);
			os.flush();
		} catch (Exception e) {
			System.out.println("-'send' Error: " + request  + "|" + message + " : " + e.toString());
			
		}		
	}
}