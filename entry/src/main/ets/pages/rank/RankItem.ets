import { CoinInfo, CoinInfoModel } from '../../models/Coin'

@Preview
@Component
export struct RankItem {
  coin: CoinInfoModel = new CoinInfoModel({} as CoinInfo)

  build() {
    Row() {
      Text(this.coin.rank)
        .fontColor($r('app.color.secondary'))
        .fontSize(14)
      Text(this.coin.username)
        .fontColor($r('app.color.secondary'))
        .margin({ left: 8, right: 18 })
        .fontWeight(FontWeight.Bold)
        .fontSize(14)
      Text(`lv:${this.coin.level}`)
        .fontColor($r('app.color.secondary'))
        .fontSize(14)
      Blank()
      Text(this.coin.coinCount?.toString())
        .fontColor($r('app.color.primary'))
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height(44)
    .border({ width: { bottom: 0.5 }, color: $r('app.color.surface_dim') })
    .padding({ left: 8, right: 8 })
  }
}