import AppKit


class AppDelegate: NSObject, NSApplicationDelegate {

    static var localMonitor: Any?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        Self.localMonitor != nil ? NSEvent.removeMonitor(Self.localMonitor!) : ()
        Self.localMonitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .mouseMoved, .scrollWheel]) { nsEvent in
            
            switch nsEvent.type {
            case .keyDown:
                print("keyDown")
            case .mouseMoved:
                print("mouseMoved")
            case .scrollWheel:
                print("scrollWheel")
            default:
                print("should never been here lol")
            }
                    
            return nsEvent
        }

    }
        
}

