## 概要

<p>
tweetbot 3では、ツイートの長押しでアクションメニューが表示される際に、直前の画面が後ろに下がりぼかしがかかる。
これ、かっこいいので真似してみた。完全に再現は出来てないけど。
</p>

<iframe width="640" height="480" src="//www.youtube.com/embed/DBhdKHwaGyw?rel=0" frameborder="0" allowfullscreen></iframe>

<p>
GitHubにてソースを取得できます： <a href='https://github.com/noradaiko/NRBlurryStepOutAnimatedTransitioning' target='_blank'>NRBlurryStepOutAnimatedTransitioning</a>
</p>



## つかいかた

`NRBlurryStepOutAnimatedTransitioning.h,m`をプロジェクトに追加します。

あなたのViewControllerにUIViewControllerTransitioningDelegateプロトコルを追加：

	@interface NRPresentedViewController : UIViewController<UIViewControllerTransitioningDelegate>
	@end

そのViewControllerクラスに以下のような実装を加えます：

	#import "NRBlurryStepOutAnimatedTransitioning.h"

	-(void)showNewController;
	{
	    UIViewController* vc = [[YourModalViewController alloc] init];
	    vc.transitioningDelegate = self;
	    [self presentViewController:vc animated:YES completion:NULL];
	}
	
	
	#pragma mark - UIViewControllerTransitioningDelegate
	
	- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
	{
	    return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:YES];
	}
	
	- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
	{
	    return [[NRBlurryStepOutAnimatedTransitioning alloc] initWithPresenting:NO];
	}

あとは `-showNewController` を好きな時に呼び出すだけ。
簡単！

