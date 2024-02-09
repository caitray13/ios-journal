// swiftlint:disable all
import Amplify
import Foundation

public struct Entry: Model {
  public let id: String
  public var name: String
  public var desc1: String?
  public var desc2: String?
  public var desc3: String?
  public var image: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      desc1: String? = nil,
      desc2: String? = nil,
      desc3: String? = nil,
      image: String? = nil) {
    self.init(id: id,
      name: name,
      desc1: desc1,
      desc2: desc2,
      desc3: desc3,
      image: image,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      desc1: String? = nil,
      desc2: String? = nil,
      desc3: String? = nil,
      image: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.desc1 = desc1
      self.desc2 = desc2
      self.desc3 = desc3
      self.image = image
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}