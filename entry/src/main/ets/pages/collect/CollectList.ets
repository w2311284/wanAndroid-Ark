import {  YtCustomBaseNavBar, YtList } from '@yt/YtKit';
import { getCollectList } from '../../api/Collect';
import { CollectItem } from './CollectItem';
import { router } from '@kit.ArkUI';
import { CollectArticleItemModel } from '../../models/Collect';

@Entry
@Component
struct CollectList {
  @State message: string = 'Hello World';
  @State articles: CollectArticleItemModel[] = []
  @State page: number = 0
  @State totalPage: number = 0

  async getCollectList(append: boolean) {
    const result = await getCollectList(this.page)
    if (append) {
       this.articles.push(...result.datas)
    }else  {
      this.articles = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  async onRefresh() {
    this.page = 0
    await this.getCollectList(false)
  }

  @Builder
  getArticleItemLayout(item: object) {
    CollectItem({article: item as CollectArticleItemModel})
      .margin({left: 16, right: 16, bottom: 10})
  }

  build() {
    Column() {
      YtCustomBaseNavBar({
        titleOptions: {
          text: '收藏文章',
          fontColor: $r('app.color.primary'),
          fontSize: 24
        },
        leftButtons: [
          {
            icon: $r('app.media.ic_arrow_back'),
            onClick: () => {
              router.back()
            }
          }
        ]
      })
      YtList(
        {
          dataSource: this.articles,
          finished: this.totalPage < this.page,
          renderItem: (item) => {
             this.getArticleItemLayout(item)
          },
          onLoad: async () => {
            await this.getCollectList(true)
          },
          onRefresh: async () => {
            await this.onRefresh()
          }
        }
      )
    }
  }
}