enum BookType {
  book,
  magazine,
  audio,
  video,

  unknown;

  static BookType fromId(String id) {
    if (id.length < 3) return BookType.unknown;
    switch (id.substring(0, 3)) {
      case 'T01': return BookType.book;
      case 'T02': return BookType.magazine;
      case 'T03': return BookType.audio;
      case 'T04': return BookType.video;
      default: return BookType.unknown;
    }
  }
}