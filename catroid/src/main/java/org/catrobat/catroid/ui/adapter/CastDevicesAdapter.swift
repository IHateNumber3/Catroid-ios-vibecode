import UIKit

public class CastDevicesAdapter: NSObject, UITableViewDataSource {
    
    private static let tag = "CastDevicesAdapter"
    
    public var devices: [String] = [] // Эквивалент списка маршрутов/устройств (MediaRouter.RouteInfo)
    
    public init(devices: [String] = []) {
        self.devices = devices
        super.init()
    }
    
    public func updateDevices(_ newDevices: [String]) {
        self.devices = newDevices
    }
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CastDeviceCell") ?? UITableViewCell(style: .default, reuseIdentifier: "CastDeviceCell")
        
        let deviceName = devices[indexPath.row]
        
        // Настройка текста ячейки (эквивалент R.id.cast_device_name)
        var content = cell.defaultContentConfiguration()
        content.text = deviceName
        content.image = UIImage(systemName: "tv.badge.wifi")
        cell.contentConfiguration = content
        
        return cell
    }
}
