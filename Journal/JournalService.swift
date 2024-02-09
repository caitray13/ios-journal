import Amplify
import SwiftUI

@MainActor
class JournalService: ObservableObject {
    @Published var entries: [Entry] = []

    func fetchNotes() async {
        do {
            let result = try await Amplify.API.query(request: .list(Entry.self))
            switch result {
            case .success(let entriesList):
                print("Fetched \(entriesList.count) notes")
                entries = entriesList.elements
            case .failure(let error):
                print("Fetch Notes failed with error: \(error)")
            }
        } catch {
            print("Fetch Notes failed with error: \(error)")
        }
    }

    func save(_ entry: Entry) async {
        do {
            let result = try await Amplify.API.mutate(request: .create(entry))
            switch result {
            case .success(let entry):
                print("Save note completed")
                entries.append(entry)
            case .failure(let error):
                print("Save Note failed with error: \(error)")
            }
        } catch {
            print("Save Note failed with error: \(error)")
        }
    }

    func delete(_ entry: Entry) async {
        do {
            let result = try await Amplify.API.mutate(request: .delete(entry))
            switch result {
            case .success(let entry):
                print("Delete note completed")
                entries.removeAll(where: { $0.id == entry.id })
            case .failure(let error):
                print("Delete Note failed with error: \(error)")
            }
        } catch {
            print("Delete Note failed with error: \(error)")
        }
    }
}
