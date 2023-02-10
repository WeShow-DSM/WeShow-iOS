import Foundation

protocol TokenLocalDataSource {
    func registerAccessToken(accessToken: String)
    func registerRefreshToken(refreshToken: String)
    func fetchAccessToken() -> String?
    func fetchRefreshToken() -> String?
    func deleteToken()
}
