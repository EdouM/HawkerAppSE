//
//  ArticleViewController.swift
//  HawkerApp
//
//  Created by Edouard MALET on 30/05/2016.
//  Copyright © 2016 Hawker. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

extension UIView {
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 0.3) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration: TimeInterval = 0.3) {
        self.transform = CGAffineTransform.identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.3, easingOffset: CGFloat = 0.05) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                    self.transform = CGAffineTransform.identity
                    }, completion: { (completed: Bool) -> Void in
                })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.3, easingOffset: CGFloat = 0.05) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                    }, completion: { (completed: Bool) -> Void in
                })
        })
    }
    
}

class ArticleViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pauseBackground: UIImageView!
    @IBOutlet weak var articlePlayButton: UIButton!
    @IBOutlet weak var articleWebView: UIWebView!
    @IBOutlet weak var articlePauseButton: UIButton!
    var articles: [Article]!
    var selectedIndex: Int!
    var article: Article?
    
    var ButtonAudioPlayer = AVAudioPlayer()
    
    var timeToPlay : TimeInterval = 0
    let blurBackground = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.extraLight))
    let blurPauseButton = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(article?.position)
        //resize des éléments ronds - blur
        pauseBackground.layer.cornerRadius = 0.5*pauseBackground.frame.size.width//Pour mettre le pause background en rond
        blurBackground.frame = pauseBackground.bounds
        blurBackground.isUserInteractionEnabled = true
        blurBackground.layer.cornerRadius = 0.5*pauseBackground.bounds.size.width
        blurBackground.clipsToBounds = true
        pauseBackground.insertSubview(blurBackground, at: 0)
        
        /*blurPauseButton.frame = articlePauseButton.bounds
        blurPauseButton.userInteractionEnabled = true
        blurPauseButton.layer.cornerRadius = 0.5*articlePauseButton.bounds.size.width
        blurPauseButton.clipsToBounds = true
        articlePauseButton.insertSubview(blurPauseButton, atIndex: 0)*/
        
        
        
        //Cache les buttons inutiles
        articlePauseButton.isHidden = true
        pauseBackground.isHidden = true
        previousButton.isHidden = true
        nextButton.isHidden = true
        if let a = article {
            ButtonAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: a.audioLink, ofType: "mp3")!))
            articleWebView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: a.articleLink, ofType: "html")!)))
        }
        //self.navigationController?.navigationBarHidden = true
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            print("Receiving remote control events\n")
        } catch {
            print("Audio Session error.\n")
        } // permet de lire lorsque l'écran est bloqué.
        
        self.view.addSubview(articlePlayButton)//Pour mettre le bouton au premier plan
        self.view.addSubview(pauseBackground)
        self.view.addSubview(articlePauseButton)
        self.view.addSubview(previousButton)
        self.view.addSubview(nextButton)
        //var Timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateSlider"), userInfo: nil, repeats: true)//Permet d'actualiser la position du slider
        articleWebView.scrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlayPause(_ sender: AnyObject) {
        articlePauseButton.isHidden = false
        articlePauseButton.zoomIn()
        pauseBackground.isHidden = false
        pauseBackground.zoomIn()
        nextButton.isHidden = false
        nextButton.zoomIn()
        previousButton.isHidden = false
        previousButton.zoomIn()
        articlePlayButton.isHidden = true
    
        
        /*blurEffectView.frame = pauseBackground.bounds
        articleWebView.addSubview(blurEffectView)//On ajoute le blur
        pauseBackground.alpha = 1//Pour rendre flou le fond*/
        
        if (ButtonAudioPlayer.isPlaying==true){
            ButtonAudioPlayer.pause()
            articlePlayButton.setBackgroundImage(UIImage(named:"round-play-button"), for: UIControlState())
            ButtonAudioPlayer.currentTime = timeToPlay
        } else {
            ButtonAudioPlayer.play()
            articlePlayButton.setBackgroundImage(UIImage(named:"pause-round-button"), for: UIControlState())
        }
    }
    @IBAction func Pause(_ sender: AnyObject) {
        articlePauseButton.zoomOut()
        //articlePauseButton.hidden = true
        pauseBackground.zoomOut()
        //pauseBackground.hidden = true
        nextButton.zoomOut()
        //nextButton.hidden = true
        previousButton.zoomOut()
        //previousButton.hidden = true
        articlePlayButton.zoomIn()
        articlePlayButton.isHidden = false
        
        
        //blurEffectView.removeFromSuperview()
        ButtonAudioPlayer.pause()
        articlePlayButton.setBackgroundImage(UIImage(named:"round-play-button"), for: UIControlState())
    }
    
    /*@IBAction func changeAudioTime(sender: AnyObject) {
        ButtonAudioPlayer.stop()
        //ButtonAudioPlayer.currentTime = NSTimeInterval(audioSlider.value)//Permet d'avancer dans la piste audio
        ButtonAudioPlayer.prepareToPlay()
        ButtonAudioPlayer.play()
    }*/
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let offset = scrollView.contentOffset.y
        
        var i : Int = 0
        print("offset",offset)
        if let abp = article?.audioBreakpoints {
            while CGFloat(abp[i].0) < offset {
                i += 1
            }
            print("i",i)
            timeToPlay = TimeInterval(abp[i].1)
            print("timeToPlay", timeToPlay)
            i = 0
            
        }
        
                
        if ButtonAudioPlayer.isPlaying == false {
            ButtonAudioPlayer.currentTime = timeToPlay
        }

    }
    
    @IBAction func nextArticle(_ sender: AnyObject) {
        if ((self.selectedIndex + 1) < self.articles.count) {
            self.selectedIndex = self.selectedIndex + 1
            let nextArticle = self.articles[self.selectedIndex]
            ButtonAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: nextArticle.audioLink, ofType: "mp3")!))
            articleWebView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: nextArticle.articleLink, ofType: "html")!)))
            article?.audioBreakpoints = nextArticle.audioBreakpoints
            ButtonAudioPlayer.currentTime = 0
            ButtonAudioPlayer.play()
            
        }
    }
    
    @IBAction func previousArticle(_ sender: AnyObject) {
        if ((self.selectedIndex) > 0) {
            self.selectedIndex = self.selectedIndex - 1
            let previousArticle = self.articles[self.selectedIndex]
            ButtonAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: previousArticle.audioLink, ofType: "mp3")!))
            articleWebView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: previousArticle.articleLink, ofType: "html")!)))
            article?.audioBreakpoints = previousArticle.audioBreakpoints
            ButtonAudioPlayer.currentTime = 0
            ButtonAudioPlayer.play()
            
        }
    }
    
}
