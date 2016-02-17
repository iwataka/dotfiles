#define _WIN32_WINNT 0x0500
#include <windows.h>
#include <stdio.h>

// Heavily inspired by
// [xolox's vim-shell](https://github.com/xolox/vim-shell/blob/master/misc/shell/shell.c)

// Return the error message and no error occured if it is emtpy
const char *_fullscreen(const int enable, HWND window, LONG styles) {
    if (enable) {
        styles &= ~WS_CAPTION & ~WS_THICKFRAME;
    } else {
        styles |= WS_CAPTION | WS_THICKFRAME;
    }

    if (!SetWindowLong(window, GWL_STYLE, styles))
        return "Could not apply window styles!";

    if (enable) {
        HMONITOR monitor = MonitorFromWindow(window, MONITOR_DEFAULTTONEAREST);
        if (!monitor)
            return "Could not get handle to monitor!";
        MONITORINFO info = { sizeof info };
        if (!GetMonitorInfo(monitor, &info))
            return "Could not get monitor information!";
        if (!SetWindowPos(window,
                    HWND_NOTOPMOST,
                    info.rcMonitor.left,
                    info.rcMonitor.top,
                    info.rcMonitor.right - info.rcMonitor.left,
                    info.rcMonitor.bottom - info.rcMonitor.top,
                    SWP_SHOWWINDOW))
            return "Could not resize window!";
    } else if (!SetWindowPos(window, HWND_NOTOPMOST, 0, 0, 0, 0,
                SWP_NOMOVE | SWP_NOSIZE | SWP_FRAMECHANGED))
        return "Could not restore window!";

    // no error occured
    return "";
}

__declspec(dllexport)
const char *toggle_fullscreen(const char *ignored) {
    HWND window = GetForegroundWindow();
    if (!window)
        return "Could not get handle to foreground window!";
    LONG styles = GetWindowLong(window, GWL_STYLE);
    if (!styles)
        return "Could not query window styles!";

    LONG enable = (styles & WS_CAPTION) | (styles & WS_THICKFRAME);

    return _fullscreen(enable, window, styles);
}

__declspec(dllexport)
const char *fullscreen(const int enable) {
    HWND window = GetForegroundWindow();
    if (!window)
        return "Could not get handle to foreground window!";
    LONG styles = GetWindowLong(window, GWL_STYLE);
    if (!styles)
        return "Could not query window styles!";

    return _fullscreen(enable, window, styles);
}

// To avoid "undefined reference to `WinMain@16`"
int main(int argc, char** argv) {
    printf("%s", "dummy main method");
    return 0;
}
