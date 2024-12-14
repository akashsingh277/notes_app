import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get collection reference for notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // Add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // Stream to fetch notes from Firestore
  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  // Update a note
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete a note
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
