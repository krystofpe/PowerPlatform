Set(
    varMobileOrDesktop,
    If(
        Location.Altitude > 0 Or Acceleration.X > 0,
        "Mobile",
        "Desktop"
    )
);