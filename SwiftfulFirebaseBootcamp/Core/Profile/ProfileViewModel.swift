//
//  ProfileViewModel.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Nick Sarno on 1/23/23.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func togglePremiumStatus() {
        guard let user else { return }
        let currentValue = user.isPremium ?? false
        Task {
            try await UserManager.shared.updateUserPremiumStatus(userId: user.userId, isPremium: !currentValue)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addUserPreference(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.addUserPreference(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeUserPreference(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeUserPreference(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addFavoriteMovie() {
        guard let user else { return }
        let movie = Movie(id: "1", title: "Avatar 2", isPopular: true)
        Task {
            try await UserManager.shared.addFavoriteMovie(userId: user.userId, movie: movie)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeFavoriteMovie() {
        guard let user else { return }

        Task {
            try await UserManager.shared.removeFavoriteMovie(userId: user.userId)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func saveProfileImage(item: PhotosPickerItem) {
        guard let user else { return }

        Task {
            guard let data = try await item.loadTransferable(type: Data.self) else { return }
            let (path, name) = try await StorageManager.shared.saveImage(data: data, userId: user.userId)
            print("SUCCESS!")
            print(path)
            print(name)
            let url = try await StorageManager.shared.getUrlForImage(path: path)
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: path, url: url.absoluteString)
        }
    }
    
    func deleteProfileImage() {
        guard let user, let path = user.profileImagePath else { return }

        Task {
            try await StorageManager.shared.deleteImage(path: path)
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: nil, url: nil)
        }
    }
    
}
