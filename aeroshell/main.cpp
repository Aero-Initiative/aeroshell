#include <Windows.h>

import std;

int main()
{
    const HWND shellTrayWnd = FindWindow(L"Shell_TrayWnd", nullptr);

    if (shellTrayWnd == nullptr)
    {
        MessageBoxW(nullptr, L"Failed to find taskbar window class", L"",
                    MB_ICONERROR | MB_OK);
        return 1;
    }

    APPBARDATA appBarData = {
        .cbSize = sizeof(APPBARDATA),
        .hWnd   = shellTrayWnd,
        .lParam = ABS_AUTOHIDE,
    };
    SHAppBarMessage(ABM_SETSTATE, &appBarData);

    SetWindowPos(shellTrayWnd, HWND_BOTTOM, 0, 0, 0, 0,
                 SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE | SWP_HIDEWINDOW);

    RECT rect{};
    GetWindowRect(GetDesktopWindow(), &rect);
    SystemParametersInfoW(SPI_SETWORKAREA, 0, &rect,
                          SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);

    return 0;
}