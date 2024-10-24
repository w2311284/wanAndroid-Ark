import { CoinInfo, CoinInfoModel } from '../../models/User'

@Preview
@Component
export struct CoinHeader {
  coin: CoinInfoModel = new CoinInfoModel({} as CoinInfo)
  build() {
    Column({space: 16}) {
      Text(this.coin.coinCount?.toString())
        .fontSize(25)
        .fontColor($r('app.color.primary'))
        .fontWeight(FontWeight.Bold)
      Text(`等级：${this.coin.level}`)
        .fontSize(12)
      Text(`排名：${this.coin.rank}`)
        .fontSize(12)
    }
    .width('100%')
    .height(120)
    .padding({top:10,bottom:10})
    .justifyContent(FlexAlign.Center)
  }
}