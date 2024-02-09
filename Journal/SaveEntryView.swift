import SwiftUI

struct SaveNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var journalService: JournalService
    @EnvironmentObject private var storageService: StorageService
    @State private var name = DateFormatter().string(from: Date())
    @State private var desc1 = ""
    @State private var desc2 = ""
    @State private var desc3 = ""
    @State private var image: Data? = nil

    var body: some View {
        Form {
            Section("Today \(name)") {
                TextField("Grateful for...", text: $desc1)
                TextField("Grateful for...", text: $desc2)
                TextField("Grateful for...", text: $desc3)
            }
            
            Section("Picture") {
                            PicturePicker(selectedData: $image)
                        }
            
            Button("Save Entry") {
                let imageName = image != nil ? UUID().uuidString : nil
                let entry = Entry(
                    name: name,
                    desc1: desc1.isEmpty ? nil : desc1,
                    desc2: desc2.isEmpty ? nil : desc2,
                    desc3: desc3.isEmpty ? nil : desc3,
                    image: imageName
                )
                
                Task {
                    await journalService.save(entry)
                    dismiss()
                }
            }
        }
    }
}
