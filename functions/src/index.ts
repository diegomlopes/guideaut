import * as functions from "firebase-functions";
import * as admin from 'firebase-admin';

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp();

export const updateSearchField = functions.firestore
    .document('recomandations/{docId}')
    .onWrite((change, context) => {
        const data = change.after.exists ? change.after.data() : null;
        if (!data) return null;

        const searchField = data ? `${data.title}`.toLowerCase() : '';
        return change.after.ref.set({ searchField }, { merge: true });
    });