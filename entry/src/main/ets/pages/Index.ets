import HomeTabs from './index/home/HomeTabs';
import ProjectTabs from './index/project/ProjectTabs';
import Series from './index/series/Series';
import Mine from './index/mine/Mine';
import Constants from '../constants/Constants';
import { GroupTabs } from './index/group/GroupTabs';

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column(){
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(Constants.FULL_PARENT)
    .onClick(()=>{
       this.currentIndex = index;
       this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController,
        index:$$this.currentIndex
      }){
        TabContent(){
          HomeTabs()
        }
        .backgroundColor($r('app.color.mainPage_backgroundColor'))
        .tabBar(this.TabBuilder(Constants.HOME_TITLE,Constants.HOME_TAB_INDEX,$r('app.media.home_selected'),$r('app.media.home_normal')))

        TabContent(){
          ProjectTabs()
        }
        .backgroundColor($r('app.color.mainPage_backgroundColor'))
        .tabBar(this.TabBuilder(Constants.PROJECT_TITLE,Constants.PROJECT_TAB_INDEX,$r('app.media.project_selected'),$r('app.media.project_normal')))

        TabContent(){
          Series()
        }
        .backgroundColor($r('app.color.mainPage_backgroundColor'))
        .tabBar(this.TabBuilder(Constants.SERIES_TITLE,Constants.SERIES_TAB_INDEX,$r('app.media.officialAcount_selected'),$r('app.media.officialAcount_normal')))
        TabContent(){
          GroupTabs()
        }
        .backgroundColor($r('app.color.mainPage_backgroundColor'))
        .tabBar(this.TabBuilder(Constants.OFFICIALACOUNT_TITLE,Constants.OFFICIALACOUNT_TAB_INDEX,$r('app.media.series_selected'),$r('app.media.series_normal')))

        TabContent(){
          Mine()
        }
        .backgroundColor($r('app.color.mainPage_backgroundColor'))
        .tabBar(this.TabBuilder(Constants.MINE_TITLE,Constants.MINE_TAB_INDEX,$r('app.media.mine_selected'),$r('app.media.mine_normal')))
      }
      .scrollable(false)
      .width(Constants.FULL_PARENT)
      .barHeight($r('app.float.mainPage_barHeight'))

    }
}