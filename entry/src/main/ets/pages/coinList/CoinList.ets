import { YtCustomBaseNavBar, YtList } from '@yt/YtKit/'
import { getCoinDataList } from '../../api/User'
import { CoinModel } from '../../models/Coin'
import { CoinInfo, CoinInfoModel } from '../../models/User'
import { CoinItem } from '../coinList/CoinItem'
import { CoinHeader } from './CoinHeader'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct CoinList {
  @State coinInfo: CoinInfoModel = new CoinInfoModel({} as CoinInfo)
  @State coinList: CoinModel[] = []
  @State page: number = 1
  @State totalPage: number = 1

  aboutToAppear(): void {
    const params = router.getParams() as CoinListParams
    this.coinInfo = params.coinInfo
  }

  async getCoinList(append: boolean) {
    const result = await getCoinDataList(this.page)
    if (append) {
      this.coinList.push(...result.datas)
    } else {
      this.coinList = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  async onRefresh() {
    this.page = 0
    this.getCoinList(false)
  }

  @Builder
  getItemLayout(item: object) {
    CoinItem({ coinItem: item as CoinModel })
  }

  @Builder
  getHeaderLayout() {
    CoinHeader({ coin: this.coinInfo })
  }

  build() {
    Column() {
      YtCustomBaseNavBar({
        titleOptions: {
          text: ''
        },
        leftButtons: [{
          icon: $r('app.media.ic_arrow_back'),
          onClick: () => {
            router.back()
          }
        }],
        rightButtons: [
          {
            icon: $r('app.media.ic_more'),
            onClick: () => {

            }
          },
          {
            icon: $r('app.media.ic_un_collect'),
            onClick: () => {
              router.pushUrl({
                url: 'pages/web/WebPage',
                params: { url: 'https://www.wanandroid.com/blog/show/2653', title: '本站积分规则' }
              })
            }
          }
        ]
      })
        .padding({ left: 16, right: 16 })
      YtList({
        dataSource: this.coinList,
        finished: this.totalPage < this.page,
        renderItem: (item: object) => {
          this.getItemLayout(item)
        },
        renderHeader: () => {
          this.getHeaderLayout()
        },
        onLoad: async () => {
          await this.getCoinList(true)
        },
        onRefresh: async () => {
          await this.onRefresh()
        },
      })
    }
    .height('100%')
    .width('100%')
  }
}

class CoinListParams {
  coinInfo: CoinInfoModel = new CoinInfoModel({} as CoinInfo)
}