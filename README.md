# iOS 15 AttributedString Markdown with custom styling

The Foundation [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) comes with a neat [Markdown initializer](https://developer.apple.com/documentation/foundation/attributedstring/3796160-init).

I was excited. Then I tried it out and was confused:

- There is no styling when [drawing](https://developer.apple.com/documentation/foundation/nsattributedstring/1524971-draw) the `AttributedString` in a custom view.
- The `AttributedString` does have some styling applied when it’s assigned to a `UILabel` or to a `UITextView`, but they are noticeably different and weird things happen to the font sizes.
- All line breaks separating the content blocks are missing.
- The `AttributedString` colors don’t react to toggling between dark and light mode.

At first I thought that Apple had shipped a broken API. Then I thought I was [holding it wrong](https://www.urbandictionary.com/define.php?term=You%27re%20Holding%20It%20Wrong).
Finally, I realized that the Markdown initializer merely adds *semantic* markup to the `AttributedString`, and that both `UILabel` and `UITextView` interpret these to a certain extent.

The Markdown initializer puts the Markdown info as *Presentation Intents* into the `AttributedString` runs.
- There are `inlinePresentationIntent`s like `.stronglyEmphasized` for bold text.
- There are `presentationIntent`s for blocks like headlines (like `.header(1)` for a `H1`.

This sample project shows how I look for these intents and replace them with actual `AttributedString` styling information like font weights and foreground colors.

I don’t know if there’s a more elegant way to solve this. Do let me know if you have a better solution!
