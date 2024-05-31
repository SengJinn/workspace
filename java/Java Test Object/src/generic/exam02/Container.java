package generic.exam02;

public class Container<K, V> {
private K Key;
private V Value;


@Override
public String toString() {
return "Container [Key=" + Key + ", Value=" + Value + "]";
}


public K getKey() {
return Key;
}

public V getValue() {
return Value;
}


public void set(K key, V value) {
Key = key;
Value = value;
}

}

