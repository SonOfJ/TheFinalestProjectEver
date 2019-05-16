class Node {
  E data;
  Node next;
  Node prev;
  Node(E newData, Node newNext, Node newPrev) {
    data = newData;
    next = newNext;
    prev = newPrev;
  }
  E getData() {
    return data;
  }
  Node next() {
    return next;
  }
  Node prev() {
    return prev;
  }
  E setData(E i) {
    E K = data;
    data = i;
    return K;
  }
  void setNext(Node other) {
    next = other;
  }
  void setPrev(Node other) {
    prev = other;
  }
  String toString() {
    String K = "" + data;
    return K;
  }
  boolean hasNext() {
    if (next == null) {
      return false;
    }
    return true;
  }
}
