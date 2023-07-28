//
//  CountyViewModel.swift
//  AssessmentTask
//
//  Created by zhanybek salgarin on 7/26/23.
//

import Foundation

protocol CountryViewModelProtocol: AnyObject {
    var countries: [CountryModelToPopulate] { get }
    var didDataLoad: (() -> Void)? { get set }
    var didErrorOccur: ((Error) -> Void)? { get set }
    
    func fetchData()
}

class CountryViewModel: CountryViewModelProtocol {
    
    var countries: [CountryModelToPopulate] = []
    var didDataLoad: (() -> Void)?
    var didErrorOccur: ((Error) -> Void)?
    
    func fetchData() {
        Task{
            let result = await fetchCountryData()
            switch result {
            case let .success(countries):
                let populatedCoutries = countries.map { CountryModelToPopulate(country: $0.name, capital: $0.capital, region: $0.region.rawValue, code: $0.code)
                }
                await MainActor.run {
                    self.countries = populatedCoutries
                    self.didDataLoad?()
                }
            case let .failure(error):
                print(error.localizedDescription)
                await MainActor.run {
                    self.didErrorOccur?(error)
                }
            }
        }
    }
    
    func fetchCountryData() async -> Result<[CountryMainModel], Error> {
        let url = URL(string: Constants.completeURL)!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            guard let countries = try? decoder.decode([CountryMainModel].self, from: data) else {
                throw CountryError.failedToDecode
            }
            return .success(countries)
        } catch {
            return .failure(error)
        }
    }
    
}

enum CountryError: Error {
    case custom(error: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String {
        switch self {
        case .custom(let error):
            return error.localizedDescription
        case .failedToDecode:
            return "Failed to decode response"
        case .invalidStatusCode:
            return "Invalid status code"
        }
    }
}
