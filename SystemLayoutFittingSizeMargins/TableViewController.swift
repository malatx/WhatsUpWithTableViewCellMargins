//
//  TableViewController.swift
//  SystemLayoutFittingSizeMargins
//
//  Created by Carlos Ribas on 7/21/16.
//  Copyright © 2016 Carlos Ribas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	private let cellIdentifier = "cellIdentifier"
	private var cachedRowHeight : CGFloat = 0

	func calculateCellHeight() -> CGFloat
	{
		let templateCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
		
		templateCell.updateConstraints()
		templateCell.layoutIfNeeded()
		let height = templateCell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
		
		return height
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		cachedRowHeight = calculateCellHeight()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

		cell.layoutIfNeeded()
		let actualHeight = cell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height

		// concat this cell's actual height onto the top label for easy inspection
		let topLabel = cell.viewWithTag(31337) as! UILabel
		topLabel.text = topLabel.text! + " " + String(actualHeight)

		let templateHeight = calculateCellHeight()
		let bottomLabel = cell.viewWithTag(31338) as! UILabel
		bottomLabel.text = bottomLabel.text! + " " + String(templateHeight)
		
        return cell
    }
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {		
		return cachedRowHeight
	}
}
