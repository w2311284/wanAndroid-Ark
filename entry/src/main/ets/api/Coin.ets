import { CoinListDataModel } from '../models/Coin'
import { Request } from '@yt/YtKit'

/**
 * 获取我的积分列表
 */
export const getCoinDataList = (page: number) => {
  return Request.get<CoinListDataModel>(`/lg/coin/list/${page}/json?page_size=20`)
}

/**
 * 获取积分排行榜
 */
export const getRankDataList = (page: number) => {
  return Request.get<CoinListDataModel>(`/coin/rank/${page}/json`)
}