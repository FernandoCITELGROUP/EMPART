//
//  TutorialViewController.swift
//  Empart
//
//  Created by fernando rosa on 06/05/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class TutorialViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource
{
    // Attributes
    lazy var orderedViewControllers:[UIViewController] = {
        return self.createArrayOfViewController()
    }()
    
    func createArrayOfViewController() -> [TutorialPageViewController]
    {
        var array:[TutorialPageViewController] = [TutorialPageViewController]()
        
        let viviViewController = storyboard?.instantiateViewController(withIdentifier: "TutorialPageViewController") as! TutorialPageViewController
//        let viviViewController:TutorialPageViewController = TutorialPageViewController()
        viviViewController.titleOfButton = "SKIP"
        viviViewController.imageName = "VIVI"
        array.append(viviViewController)
        
        let conservaViewController:TutorialPageViewController = storyboard?.instantiateViewController(withIdentifier: "TutorialPageViewController") as! TutorialPageViewController
        conservaViewController.titleOfButton = "SKIP"
        viviViewController.imageName = "CONSERVA"
        array.append(conservaViewController)
        
        let riviviViewController:TutorialPageViewController = storyboard?.instantiateViewController(withIdentifier: "TutorialPageViewController") as! TutorialPageViewController
        riviviViewController.titleOfButton = "SKIP"
        viviViewController.imageName = "animazioni_2"
        array.append(riviviViewController)
        
        return array
    }
    
    // UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    // Functions
    func newVc(viewController:String) -> UIViewController{
        return UIStoryboard(name:"Tutorial", bundle:nil).instantiateViewController(withIdentifier: viewController)
    }

    // Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController as! TutorialPageViewController], direction: .forward, animated: true, completion: nil)
        }
        
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.black
        
    }
}
