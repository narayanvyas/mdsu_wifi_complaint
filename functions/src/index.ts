import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';

admin.initializeApp();

export const deleteUserData = functions.firestore
  .document('/USERS/{uid}')
  .onDelete((snapshot, context) => {
    console.log('Deleting User From Authentication');
    return admin.auth().deleteUser(context.params.uid);
  });