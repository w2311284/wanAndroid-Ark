import { ArticleItem } from './ArticleItem';
import { getArticleList } from '../../../api/Article';
import { ArticleInfoItemModel } from '../../../models/Article';
import { getBannerList } from '../../../api/Banner';
import BannerItemModel from '../../../models/Banner';
import { YtList } from '@yt/YtKit/';
import Banner from './Banner';

@Preview
@Component
export default struct Recommended {
  @State private banners: Array<BannerItemModel> = [];
  @State private articleList: Array<ArticleInfoItemModel> = [];
  @State page: number = 0
  @State totalPage: number = 1

  aboutToAppear(): void {
    this.getBannerList()
  }

  async getBannerList() {
    this.banners = await getBannerList()
  }

  async onRefresh() {
    this.page = 0
    await this.onLoadMore(false)
  }

  async onLoadMore(append: boolean) {
    const result = await getArticleList(this.page)
    if (append) {
      this.articleList.push(...result.datas)
    }else  {
      this.articleList = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  @Builder
  contentLayout(item: object) {
    ArticleItem({item: item as ArticleInfoItemModel})
  }

  @Builder
  getBannerLayout() {
    Banner({banners: this.banners})
  }

  build() {
    YtList({
      dataSource: this.articleList,
      finished: this.totalPage < this.page,
      onRefresh: async () => {
        await this.onRefresh()
      },
      onLoad: async () => {
        await this.onLoadMore(true)
      },
      renderItem: (item: object) => {
        this.contentLayout(item)
      },
      renderHeader: () => {
        this.getBannerLayout()
      }
    })
  }
}