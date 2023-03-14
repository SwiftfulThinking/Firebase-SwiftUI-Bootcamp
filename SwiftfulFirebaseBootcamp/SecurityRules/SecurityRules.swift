//
//  SecurityRules.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Nick Sarno on 1/23/23.
//

import Foundation

// https://firebase.google.com/docs/firestore/security/rules-structure
// https://firebase.google.com/docs/rules/rules-language

/*
 rules_version = '2';
 service cloud.firestore {
   match /databases/{database}/documents {
     match /users/{userId} {
       allow read: if request.auth != null;
       allow write: if request.auth != null && request.auth.uid == userId;
       // allow write: if resource.data.user_isPremium == false;
       // allow write: if request.resource.data.custom_key == "1234";
       //allow write: if isPublic();
     }
     
     match /users/{userId}/favorite_products/{userFavoriteProductID} {
           allow read: if request.auth != null;
           allow write: if request.auth != null && request.auth.uid == userId;
     }
     
     match /products/{productId} {
         //allow read, write: if request.auth != null;
       //allow create: if request.auth != null;
       //allow read: if request.auth != null && isAdmin(request.auth.uid);
       allow read: if request.auth != null;
       allow create: if request.auth != null && isAdmin(request.auth.uid);
       allow update: if request.auth != null && isAdmin(request.auth.uid);
       allow delete: if false;
     }
     
     function isPublic() {
         return resource.data.visibility == "public";
     }
     
     function isAdmin(userId) {
             // let adminIds = ["FLQSb7fAHzdGSeMop37sLEkif3l1", "abc"];
                 // return userId in adminIds;
         return exists(/databases/$(database)/documents/admins/$(userId));
         }
   }
 }

 // read
 // get - single document reads
 // list - queries and collection read requests
 //
 // write
 // create - add document
 // update - edit document
 // delete - delete document
 */
