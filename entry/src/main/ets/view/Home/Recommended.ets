import Constants from '../../common/constants/Constants'
import Article, { Tag } from '../../common/model/ArticleModel';
import Banner from '../../common/model/BannerModel';
import HomeViewModel from '../../viewModel/HomeViewModel';
import { LengthMetrics } from '@kit.ArkUI';
import Page from '../../common/model/PageModel';


@Preview
@Component
export default struct Recommended {
  private viewModel: HomeViewModel = new HomeViewModel()
  @State private banners: Array<Banner> = [];
  @State private articles: Array<Article> = [];

  aboutToAppear(): void {
      this.viewModel.getBanner().then((data: Banner[]) => {
        this.banners = data
      });

      this.viewModel.getHomeArticleList(1).then((data: Page) => {
          this.articles = this.articles.concat(data.datas)
        console.log('home list ',data.datas.toString())
        console.log('article count',this.articles.length)
      });

  }

  build() {
    List() {
      this.BannerLayout()
      this.ContentLayout()
    }
    .height('100%')
    .scrollBar(BarState.Off)
  }

  @Builder
  BannerLayout() {
    ListItem() {
      Swiper() {
        ForEach(this.banners, (item: Banner) => {
          Image(item.imagePath)
            .width('100%')
            .height('100%')
        })
      }
      .height(180)
      .borderRadius(15)
      .margin({left:16,right:16,top:6,bottom:6})
      .indicator(
        new DotIndicator()
          .itemWidth(10)
          .itemHeight(10)
          .selectedItemWidth(10)
          .selectedItemHeight(10)
          .color(Color.White)
          .selectedColor(Color.Brown)
      )
    }
  }

  @Builder
  ContentLayout() {
    ForEach(this.articles, (item: Article) => {
      ListItem() {
        this.ArticleItemLayout(item)
      }
    })
  }


  @Builder
  ArticleItemLayout(item: Article) {
    Column() {
      Row() {
        Row() {
          Text(item.author)
            .margin({ right: 8 })
            .fontColor($r('app.color.md_theme_on_surface_variant'))
            .fontSize(13)
          if (item.fresh) {
            Text('新')
              .fontColor($r('app.color.material_red_A400'))
              .fontSize(11)
              .margin({ right: 8 })
          }
          if (item.isTopic) {
            Text('置顶')
              .fontColor($r('app.color.material_red_A400'))
              .fontSize(11)
              .margin({ right: 8 })
          }
          ForEach(item.tags, (tag: Tag) => {
            Text(tag.name)
              .fontSize(11)
              .fontColor($r('app.color.material_green_600'))
              .margin({ right: 8 })
              .onClick(() => {

              })
          })
        }

        Text(item.niceDate)
          .fontSize(13)
          .fontColor($r('app.color.md_theme_on_surface_variant'))


      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(item.title)
        .margin({ top: 12, bottom: 12, left: 0 })
        .width('100%')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.begonia_red_light_onSurface'))
        .lineSpacing(LengthMetrics.px(20))

      Row() {
        Text(`${item.superChapterName}·${item.chapterName}`)
          .fontSize(13)
          .fontColor($r('app.color.iris_blue_light_onSurfaceVariant'))
        Image(item.collect ? $r('app.media.icon_collect') : $r('app.media.icon_uncollect'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .backgroundColor($r('app.color.secondary_background_container'))
    .borderRadius(15)
    .justifyContent(FlexAlign.Start)
    .padding(16)
    .margin({top:6,bottom:6,left:16,right:16})
    .shadow({radius: 10, color:Color.Gray})
  }
}