# 100daysOfSwiftUI

## Day 36 techniques

### 1️⃣ Create multiple screens

-   Class confirming to 'ObservableObject' protocol & @Published & @StateObject & @ObservedObject
    -   @Published: if there is a change of the @Published property, iOS would "publish" an announcement about the change to SwiftUI views. The views that have the instance wrapped in @StateObject will notice the change.
        -   (@Published: 이게 붙은 프로퍼티가 변경되면 swiftUI 뷰한테 알려줌. 그러면 swiftUI 뷰들은 어떤 클래스가 알려줬는지 확인할 수 있나? 그건 @StateObject의 역할임. )
    -   ObservableObject: "we want other things to monitor this(which conforms to ObservableObject protocol) for any changes"
    -   @StateObject: when create the shared data for the first time
    -   @ObservedObject: when use(read, modify...) the shared data in a different view
-   @State is designed...
    -   to store simple local data of one view
    -   to track local structs (rather than external classes).
-   Also when we use @State,

    -   we ask SwiftUI watch property change.
    -   when there is a change from 'Struct', it destroys and recreates whole struct and @State can spot the change
    -   on the other hand, class can modify its property directly and @State cannot notice it.

-   So we should use 'class' (conforms to ObservableObject) for data that will be shared with other views. Property wrapper would be @StateObject or @ObservedObject

### 2️⃣ Show and hide views (sheet)

-   define conditions which decide to show or dismiss sheets
-   @Environment
    -   ask @Environment to dismiss the view because @Environment knows how to do it(..?)

### 3️⃣ Remove rows from a list including ForEach

-   .onDelete() only exists on ForEach

### 4️⃣ Load & save user data (UserDefaults)

-   UserDefaults is appropriate for simple values(integers, booleans..) or simple user preferences
-   it is automatically loaded when the app launches
-   the size of data should be less than 512KB
-   @AppStorage

### 5️⃣ Codable protocal for archiving and unarchiving data (simple version)

-   'Codable' is a speacial protocol for 'archiving and unarchiving data'
    -   which means converting objects to plain texts and back again.
-   여기서는 archive해서 UserDefaults에 넣고, UserDefaults에서 가져온 것을 unarchive 하고...
-   JSONEncoder()
    -   convert Swift data to JSON
-   JSONDecoder()
    -   convert JSON to Swift codable type
-   'Data' type
    -   it is designed to store any kind of data(string, integers, zip files...)
    -   it is one of the types supported by UserDefaults
