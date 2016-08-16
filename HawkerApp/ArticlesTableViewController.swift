//
//  ArticlesTableViewController.swift
//  HawkerApp
//
//  Created by Edouard MALET on 01/06/2016.
//  Copyright © 2016 Hawker. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    var articles: [Article]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let article1 = Article()
        let article2 = Article()
        let article3 = Article()
        let article4 = Article()
        let article5 = Article()
        let article6 = Article()
        let article7 = Article()
        let article8 = Article()
        let article9 = Article()
        
        article1.position = 1
        article1.audioLink = "TTSseedup"
        article1.articleLink = "articleSeedUp"
        article1.tableViewImage = "Logo-Seed-Up"
        article1.articleName = "Des jeunes geeks, des poules et plein de projets"
        article1.audioBreakpoints = [(332,0),
                                     (310.5,9),
                                     (425,18.7),
                                     (529,24),
                                     (661,36.7),
                                     (815.5,43.8),
                                     (1010.5,64.7),
                                     (1227,83),
                                     (1509,97.7),
                                     (1580,105),
                                     (1621,109),
                                     (1744,116.7),
                                     (1834,123.5),
                                     (1945,126.5),
                                     (1968.5,129.7),
                                     (2115,140.7),
                                     (2182,146.7),
                                     (2225,150.7),
                                     (2293,155.2),
                                     (2374,161.5),
                                     (2545,173.2),
                                     (2586,178.5),
                                     (2675,185.2),
                                     (2824,185.2),
                                     (2889,201.7),
                                     (2936,205.7),
                                     (3216,207.8),
                                     (3438,227),
                                     (3661,229),
                                     (3705,234.4),
                                     (3771,241.1),
                                     (3815,245),
                                     (3977,249),
                                     (4013,255),
                                     (4089,261),
                                     (4200,271),
                                     (4304,278.4),
                                     (4413,290.8),
                                     (4478,296),
                                    (10000,303.5)]
        
        article2.position = 2
        article2.audioLink = "TTSenergie"
        article2.articleLink = "articleEnergie"
        article2.tableViewImage = "energie"
        article2.articleName = "2015, année record pour les énergies renouvelables."
        article2.audioBreakpoints = [(349,0),
                                     (500,7),
                                     (570,19.9),
                                     (1104,29),
                                     (1194,43.4),
                                     (1342,52.1),
                                     (1428,61.7),
                                     (1496,70.5),
                                     (1667,80),
                                     (1689,91.8),
                                     (2024,95.4),
                                     (2110,107.1),
                                     (2154,115),
                                     (2239,118.8),
                                     (2345,129.7),
                                     (2652,137.3),
                                     (2726,159.7),
                                    (10000,168.2)]
        
        article3.position = 3
        article3.audioLink = "TTSanglais"
        article3.articleLink = "articleAnglais"
        article3.tableViewImage = "Logo-cannes"
        article3.articleName = "Cannes Film Festival Announces Lineup"
        article3.audioBreakpoints = [(436.5,0),
                                     (506.5,16.5),
                                     (607,27.6),
                                     (2000,34.5)]
        
        article4.position = 4
        article4.audioLink = "TTSseedup"
        article4.articleLink = "articleSeedUp"
        article4.tableViewImage = "Avion"
        article4.articleName = "L'armement français à plein régime"
        article4.audioBreakpoints = [(332,0),
                                     (398,9),
                                     (503,18.7),
                                     (612,24),
                                     (748,36.7),
                                     (902,43.8),
                                     (1093,64.7),
                                     (1354,83),
                                     (1397.5,97.7),
                                     (1440.5,105),
                                     (1545,109),
                                     (1587,116.7),
                                     (1720,123.5),
                                     (1745,126.5),
                                     (1871.5,129.7),
                                     (1914.5,140.7),
                                     (1959,146.7),
                                     (2001.5,150.7),
                                     (2207.5,155.2),
                                     (2234,161.5),
                                     (2275.5,173.2),
                                     (2343,178.5),
                                     (2446,185.2),
                                     (2513.5,185.2),
                                     (2532.5,201.7),
                                     (2820.5,205.7),
                                     (2994,207.8),
                                     (3254.5,227),
                                     (3301.5,229),
                                     (3344.5,234.4),
                                     (3388.5,241.1),
                                     (3529,245),
                                     (3573.5,249),
                                     (3619,255),
                                     (3707,261),
                                     (3806.5,271),
                                     (3897,278.4),
                                     (3933,290.8),
                                     (4011.5,296),
                                     (10000,303.5)]
        
        article5.position = 5
        article5.audioLink = "TTSenergie"
        article5.articleLink = "articleEnergie"
        article5.tableViewImage = "Facebook"
        article5.articleName = "Le 'Safety Check' activé aux Etats-Unis"
        article5.audioBreakpoints = [(346,0),
                                     (496.5,7),
                                     (563.5,19.9),
                                     (1111.5,29),
                                     (1179.5,43.4),
                                     (1304,52.1),
                                     (1370,61.7),
                                     (1436,70.5),
                                     (1564,80),
                                     (1588,91.8),
                                     (1930,95.4),
                                     (1995.5,107.1),
                                     (2016.5,115),
                                     (2104,118.8),
                                     (2188,129.7),
                                     (2454,137.3),
                                     (2521,159.7),
                                     (10000,168.2)]
        
        article6.position = 6
        article6.audioLink = "TTSanglais"
        article6.articleLink = "articleAnglais"
        article6.tableViewImage = "FrenchTouch"
        article6.articleName = "Oskar Guilbert, le miraculé de la French Touch"
        article6.audioBreakpoints = [(460,0),
                                     (575,16.5),
                                     (676,27.6),
                                     (2000,34.5)]

        
        article7.position = 7
        article7.audioLink = "TTSseedup"
        article7.articleLink = "articleSeedUp"
        article7.tableViewImage = "Linkedin"
        article7.articleName = "Microsoft rachète Linkedin pour 26 milliards de dollars"
        article7.audioBreakpoints = [(332,0),
                                     (398,9),
                                     (503,18.7),
                                     (612,24),
                                     (748,36.7),
                                     (902,43.8),
                                     (1093,64.7),
                                     (1354,83),
                                     (1397.5,97.7),
                                     (1440.5,105),
                                     (1545,109),
                                     (1587,116.7),
                                     (1720,123.5),
                                     (1745,126.5),
                                     (1871.5,129.7),
                                     (1914.5,140.7),
                                     (1959,146.7),
                                     (2001.5,150.7),
                                     (2207.5,155.2),
                                     (2234,161.5),
                                     (2275.5,173.2),
                                     (2343,178.5),
                                     (2446,185.2),
                                     (2513.5,185.2),
                                     (2532.5,201.7),
                                     (2820.5,205.7),
                                     (2994,207.8),
                                     (3254.5,227),
                                     (3301.5,229),
                                     (3344.5,234.4),
                                     (3388.5,241.1),
                                     (3529,245),
                                     (3573.5,249),
                                     (3619,255),
                                     (3707,261),
                                     (3806.5,271),
                                     (3897,278.4),
                                     (3933,290.8),
                                     (4011.5,296),
                                     (10000,303.5)]
        
        article8.position = 8
        article8.audioLink = "TTSenergie"
        article8.articleLink = "articleEnergie"
        article8.tableViewImage = "Marseille"
        article8.articleName = "Affrontements violents à Marseille"
        article8.audioBreakpoints = [(346,0),
                                     (496.5,7),
                                     (563.5,19.9),
                                     (1111.5,29),
                                     (1179.5,43.4),
                                     (1304,52.1),
                                     (1370,61.7),
                                     (1436,70.5),
                                     (1564,80),
                                     (1588,91.8),
                                     (1930,95.4),
                                     (1995.5,107.1),
                                     (2016.5,115),
                                     (2104,118.8),
                                     (2188,129.7),
                                     (2454,137.3),
                                     (2521,159.7),
                                     (10000,168.2)]
        
        article9.position = 9
        article9.audioLink = "TTSanglais"
        article9.articleLink = "articleAnglais"
        article9.tableViewImage = "Pompidou"
        article9.articleName = "Clément Chérous part au MoMA de San Francisco"
        article9.audioBreakpoints = [(436.5,0),
                                     (506.5,16.5),
                                     (607,27.6),
                                     (2000,34.5)]

        
        articles = [article1, article2, article3, article4, article5, article6, article7, article8, article9]
        
        self.extendedLayoutIncludesOpaqueBars = true
        navigationController?.navigationBar.barTintColor = UIColor.black//changer la couleur du header
        //self.navigationItem.title = "Le Journal"//Change le titre du header
        //navigationController?.navigationBar.tintColor = .whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.white
        ]//change la couleur du texte du header.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let a = articles {
            return a.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        let article = articles?[(indexPath as NSIndexPath).row]
        
        if let a = article {
            cell.textLabel?.text = a.articleName
            cell.textLabel?.font = UIFont(name: "Avenir", size: 18)
            cell.textLabel?.numberOfLines = 0
            if let i = a.tableViewImage {
                cell.imageView?.image = UIImage(named: i)
            }
            
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowArticle" {
            let articleVC = segue.destination as? ArticleViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            
            //articleVC?.article = articles?[indexPath.row]
            articleVC?.articles = articles
            articleVC?.selectedIndex = (indexPath as NSIndexPath).row
            articleVC?.article = articles?[(indexPath as NSIndexPath).row]
        }
            
        }
    
    

}
