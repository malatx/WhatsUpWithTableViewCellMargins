# WhatsUpWithTableViewCellMargins
A minimal demo project illustrating unintuitive behavior with layout margins, storyboard prototype table view cells, and systemLayoutSizeFittingSize.

This demo project features two configurations of prototype table view cells. 

In the first scene (initial root view controller when launched), the two labels are constrained to the container margins on all sides. The table view controller attempts to calculate the height of this cell by calling systemLayoutSizeFittingSize() on a dequeued cell instance in viewDidLoad(). This is then compared to the result of calling systemLayoutSizeFittingSize() in cellForRowAtIndexPath(). The sizes on an iPhone 6 simulator running iOS 9.3 are Actual Height: 63, Cached Height: 57.5 and this leads to clipped cell content.

Tap the "No Margins" button in the upper left corner to switch to a similar scene as the first. This time, the two labels in the prototype cell are constrained to container margins on left and right, but top and bottom are constrained to container and hard-coded with a constant of 8. This matches the default layout margin. In this case, the sizes are Actual Height: 57.5, Cached Height: 57.5 and the cell content is not clipped.

The expected behavior would be for the height to always either be 63 or 57.5, regardless of if the top/bottom constraints are to container margin or to a hard-coded constant of 8 from the container top/bottom.
