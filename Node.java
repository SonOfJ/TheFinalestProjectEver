public class Node {
  private E data;
  private Node next;
  private Node prev;
  public Node (E newData, Node newNext, Node newPrev) {
    data = newData;
    next = newNext;
    prev = newPrev;
  }
  public E getData() {
    return data;
  }
  public Node next() {
    return next;
  }
  public Node prev() {
    return prev;
  }
  public E setData(E i) {
    E K = data;
    data = i;
    return K;
  }
  public void setNext(Node other) {
    next = other;
  }
  public void setPrev(Node other) {
    prev = other;
  }
  public String toString() {
    String K = "" + data;
    return K;
  }
  public boolean hasNext() {
    if (next == null) {
      return false;
    }
    return true;
  }
}
