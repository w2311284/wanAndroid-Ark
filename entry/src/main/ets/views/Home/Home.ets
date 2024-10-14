import Constants from '../../constants/Constants';
import Answer from './Answer';
import Recommended from './Recommended'
import Square from './Square';

@Component
export default struct Home {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  TabBuilder(title: string, index: number) {
    Column() {
      Text(title)
        .margin({ top: 14, bottom: 10 })
        .fontSize(14)
        .fontWeight(this.currentIndex === index ? 500 : 300)
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))

      Divider()
        .strokeWidth(3)
        .color($r('app.color.mainPage_selected'))
        .opacity(this.currentIndex === index ? 1 : 0)
        .width('50%')
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width(Constants.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }



  build() {
    Tabs({
      controller: this.tabsController
    }) {
      // 推荐
      TabContent() {
        Recommended()
      }.tabBar(this.TabBuilder(Constants.RECOMMENDED_TITLE, 0))

      /* 广场 */
      TabContent() {
        Square()
      }.tabBar(this.TabBuilder(Constants.SQUARE_TITLE, 1))

      TabContent() {
        Answer()
      }.tabBar(this.TabBuilder(Constants.ANSWER_TITLE, 2))
    }
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })


  }
}