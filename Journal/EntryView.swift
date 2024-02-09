import SwiftUI

struct EntryView: View {
    @State var entry: Entry

        var body: some View {
            HStack(alignment: .center, spacing: 5.0) {
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(Date.now, format: .dateTime.day().month().year())
                        .bold()
                }

                if let image = entry.image {
                        Spacer()
                        RemoteImage(name: image)
                            .frame(width: 30, height: 30)
                    }
            }
        }
}
