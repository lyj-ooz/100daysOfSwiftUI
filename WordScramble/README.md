# 100daysOfSwiftUI

## WordScramble (day29 ~ 31)

-   List
    -   List vs. Form
        -   List is for presentation of data.
        -   Form is rather for requesting user input
    -   can contain dynamic & static view
    -   iterate arrays directly (may need id: \\.self)
    -   .listStyle(.grouped)
-   Bundle
    -   every apps has main bundle (& other additional bundles)
    -   stores assets, files(.txt, XML or JSON...), compiled Swift code and etc. in one place for the app
    -   Bundle.main.url()
-   fatalError()
    -   always terminate apps immediately
-   String methods

    1.  split strings into an array
        ```swift
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        // ["a", "b", "c"]
        ```
    2.  remove whitespace & new lines
        ```swift
        let word = " apple "
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        // "apple"
        ```
    3.  check spellings

        ```swift
        let word = "swift"
        let checker = UITextChecker()

        // to scan from the start to end of 'word'
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        ```

-   .onAppear()
    -   execute a closure when a view is shown
-   .onSubmit(yourFunc)
    -   will be triggerd when the user presses 'return' on the keyboard
