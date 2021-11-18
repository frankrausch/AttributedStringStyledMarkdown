//
//  Created by Frank Rausch on 2021-11-13.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAttributedString()
    }

    @IBAction func segmentedControlDidChange(_ sender: Any) {
        updateAttributedString()
    }

    private func updateAttributedString() {

        let markdownString = """
# Headline 1
## Headline 2

Here is an [Example Link](https://example.com). Lorem ipsum **bold** dolor sit _italic_ amet, consectetur **adipisicing** elit.

- List item 1 lorem ipsum dolor sit amet lorem ipsum dolor
- List item 2

1. List item 1
1. List item 2
1. List item 2

### Headline 3

Ut enim ad `inline code` minim veniam, ~~strikethrough~~ quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

> Blockquote loorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

```
5 LET S = 0
10 MAT INPUT V
20 LET N = NUM
30 IF N = 0 THEN 99
40 FOR I = 1 TO N
45 LET S = S + V(I)
50 NEXT I
60 PRINT S/N
70 GO TO 5
99 END
```

"""

        let defaultMarkdown = try! AttributedString(markdown: markdownString)
        let styledMarkdown = try! AttributedString(styledMarkdown: markdownString)

        let attributed = segmentedControl.selectedSegmentIndex == 0 ? defaultMarkdown : styledMarkdown

        drawView.attributedText = NSAttributedString(attributed)
        label.attributedText = NSAttributedString(attributed)
        textView.attributedText = NSAttributedString(attributed)
    }

}

