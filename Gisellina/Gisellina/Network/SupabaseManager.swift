//
//  SupabaseManager.swift
//  Gisellina
//
//  Created by Jamin on 6/3/25.
//


import Foundation
import Supabase

final class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        self.client = SupabaseClient(supabaseURL: URL(string: "https://yzvinmvscvjoreshnzxx.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl6dmlubXZzY3Zqb3Jlc2huenh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4MjQzMDIsImV4cCI6MjA2NDQwMDMwMn0.Pibi7DI4-yX3KaqgulpP8gJ6lqn5ru4Tniy5dRuQxKQ")
    }
}


