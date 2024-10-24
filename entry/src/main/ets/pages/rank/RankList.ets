import { YtCustomBaseNavBar, YtList } from '@yt/YtKit';
import { getRankDataList } from '../../api/Coin';
import { CoinInfo, MyCoinModel } from '../../models/Coin';
import { router } from '@kit.ArkUI';
import { RankItem } from './RankItem';

@Entry
@Component
struct RankList {
  @State message: string = 'Hello World';
  @State page: number = 1
  @State rankList: MyCoinModel[] = []
  @State totalPage: number = 1

  async getRankList(append: boolean) {
    const result = await getRankDataList(this.page)
    if (append) {
      this.rankList.push(...result.datas)
    } else {
      this.rankList = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  async onRefresh() {
    this.page = 1
    await this.getRankList(false)
  }

  @Builder
  getRankItemLayout(item: object) {
      RankItem({coin: item as CoinInfo})
  }

  build() {
    Column() {
      YtCustomBaseNavBar({
        titleOptions: {
          text: '积分排行榜',
          fontColor: $r('app.color.primary'),
          fontWeight: FontWeight.Bold
        },
        leftButtons: [{
          icon: $r('app.media.ic_arrow_back'),
          onClick: () => {
            router.back()
          }
        }]
      })
        .padding({ left: 8, right: 8 })

      YtList({
        dataSource: this.rankList,
        renderItem: (item: object) => {
          this.getRankItemLayout(item)
        },
        onRefresh: async () => {
          await this.onRefresh()
        },
        onLoad: async () => {
          await this.getRankList(true)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}