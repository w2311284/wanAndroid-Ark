import { Request } from '@yt/YtKit'
import BannerItemModel from '../models/Banner'

/**
 * 获取banner
 */
export const getBannerList = () => {
  return Request.get<BannerItemModel[]>('/banner/json')
}