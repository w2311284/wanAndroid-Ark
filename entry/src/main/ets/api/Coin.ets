import { CoinListDataModel } from '../models/Coin'
import { YTRequest } from '@yt/foundation'
import { COIN_LIST, COIN_RANK } from './Url'

/**
 * 获取我的积分列表
 */
export const getCoinDataList = (page: number) => {
  return YTRequest.shared().get<CoinListDataModel>(`${COIN_LIST}${page}/json?page_size=20`)
}

/**
 * 获取积分排行榜
 */
export const getRankDataList = (page: number) => {
  return YTRequest.shared().get<CoinListDataModel>(`${COIN_RANK}${page}/json`)
}