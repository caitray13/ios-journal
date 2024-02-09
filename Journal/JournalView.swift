import SwiftUI

struct JournalView: View {
    @EnvironmentObject private var authenticationService: AuthenticationService
    @EnvironmentObject private var journalService: JournalService
    @EnvironmentObject private var storageService: StorageService
    @State private var isSavingNote = false
    
    var body: some View {
        NavigationStack{
            List {
                if journalService.entries.isEmpty {
                    Text("No journal entries")
                }
                ForEach(journalService.entries, id: \.id) { entry in
                    EntryView(entry: entry)
                }
                .onDelete { indices in
                    for index in indices {
                        let entry = journalService.entries[index]
                        Task {
                            await journalService.delete(entry)
                            if let image = entry.image {
                                await storageService.remove(withName: image)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Gratitude Journal")
            .toolbar {
                Button("Sign Out") {
                    Task {
                        await authenticationService.signOut()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("⨁ New Journal Entry") {
                        isSavingNote = true
                    }
                    .bold()
                }
            }
            .sheet(isPresented: $isSavingNote) {
                SaveNoteView()
            }
        }
        .task {
            await journalService.fetchNotes()
        }
    }
}
