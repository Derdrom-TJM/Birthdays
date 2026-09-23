import SwiftUI
import Playgrounds
import SwiftData

struct ContentView: View {
    @Query var friends: [Friend] = []
    @Environment(\.modelContext) private var context
    @State var newName = ""
    @State var newBirthday = Date.now
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) {friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save"){
                            let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = .now
                        }
                        .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        .task {
            context.insert(
                Friend(name: "Lindsey", birthday: .now))
            context.insert(
                Friend(name: "Kay", birthday: Date(timeIntervalSince1970: 0)))
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self,inMemory: true)
}

