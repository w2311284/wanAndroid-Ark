import { YTRequest } from '@yt/foundation'
import { ToolModel } from '../models/Tool'
import { LoginFormModel,  UserInfoModel, UserModel } from '../models/User'
import { LOGIN, TOOL_LIST, USER_INFO } from './Url'

export const login = (params: LoginFormModel) => {
  return YTRequest.shared().post<UserInfoModel>(LOGIN,params)
}

export const getUserInfo = () => {
  return YTRequest.shared().get<UserModel>(USER_INFO)
}

export const getToolList = () => {
  return YTRequest.shared().get<ToolModel[]>(TOOL_LIST)
}