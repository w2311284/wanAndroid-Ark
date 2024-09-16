import Article, { Tag } from '../../common/model/ArticleModel';
import Banner from '../../common/model/BannerModel';
import Page from '../../common/model/PageModel';
import { ArticleItem } from './ArticleItem';
import { getBanner, getHomeArticleList } from '../../api/home/HomeApi';


@Preview
@Component
export default struct Recommended {
  @State private banners: Array<Banner> = [];
  @State private articles: Array<Article> = [];

  aboutToAppear(): void {
      getBanner().then((data: Banner[]) => {
        this.banners = data
      });

      getHomeArticleList(1).then((data: Page) => {
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
        ArticleItem({item})
      }
    })
  }
}