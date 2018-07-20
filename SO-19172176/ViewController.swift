//
//  ViewController.swift
//  SO-19172176
//
//  Copyright © 2017, 2018 Xavier Schott
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class ViewController: UIViewController {
    
    // Simulates "Copy"
    @IBAction func putAction(_ sender: AnyObject) {
        let pb = pasteBoard()
        pb.setValue("Something", forPasteboardType: UIPasteboardName.general.rawValue)
    }
    
    // Option 1: Use this if you want to clear all entries
    // pb.items will log []
    @IBAction func deleteEntirePasteboard(_ sender: AnyObject) {
        UIPasteboard.remove(withName: UIPasteboardName(rawValue: pasteboardName()))
    }

    // Option 2: Use this to not only remove an entry and its dictionary
    // pb.items will also log [] if all entries are cleared
    @IBAction func clearUsingRemove(_ sender: AnyObject) {
        let pb = pasteBoard()
        pb.items = [[String : Any]]()
    }
    
    // Option 3: This is the generally accepted approach
    // pb.items will log [{}], showing an empty dictionary
    // pb.containsPasteboardTypes will return nil as well
    @IBAction func clearUsingQuotes(_ sender: AnyObject) {
        let pb = pasteBoard()
        pb.setValue("", forPasteboardType: UIPasteboardName.general.rawValue)
    }

    @IBAction func logAction(_ sender: AnyObject) {
        let pb = pasteBoard()
        print("\(pb.items)")
    }
    
    @IBAction func logPasteboardType(_ sender: AnyObject) {
        let pb = pasteBoard()
        print("\(pb.contains(pasteboardTypes: [UIPasteboardName.general.rawValue]))")
    }
    
    func pasteBoard() -> UIPasteboard {
        return UIPasteboard(name: UIPasteboardName(rawValue: pasteboardName()), create: true)!
    }
    
    func pasteboardName() -> String
    {
        return "19172176"
    }
}

