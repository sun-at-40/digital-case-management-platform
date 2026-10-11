<?php
// Shared layout helpers for the login page and the admin / officer / cid areas.

function ui_h($value)
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

function ui_logo_svg()
{
    return '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 1 3 5v6c0 5.5 3.8 10.7 9 12 5.2-1.3 9-6.5 9-12V5l-9-4zm0 4.2 1.7 3.4 3.8.5-2.8 2.7.7 3.8-3.4-1.8-3.4 1.8.7-3.8-2.8-2.7 3.8-.5L12 5.2z"/></svg>';
}

// $prefix is the relative path to the project root ('' for root, '../' for sub folders)
function ui_head($prefix, $title = 'Dindigul Police Service', $bodyClass = 'app')
{
    echo '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">'
        . '<meta http-equiv="X-UA-Compatible" content="IE=edge">'
        . '<meta name="viewport" content="width=device-width, initial-scale=1">'
        . '<title>' . ui_h($title) . '</title>'
        . '<link rel="preconnect" href="https://fonts.googleapis.com">'
        . '<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">'
        . '<link rel="stylesheet" href="' . $prefix . 'assets/css/bootstrap.min.css">'
        . '<link rel="stylesheet" href="' . $prefix . 'assets/css/dataTables.bootstrap.min.css">'
        . '<link rel="stylesheet" href="' . $prefix . 'assets/css/modern.css">'
        . '</head><body class="' . ui_h($bodyClass) . '">';
}

function ui_brandbar($subtitle = 'Digital Case Management Platform')
{
    echo '<header class="brandbar"><div class="logo">' . ui_logo_svg() . '</div>'
        . '<div><div class="title">Dindigul Police</div><div class="subtitle">' . ui_h($subtitle) . '</div></div></header>';
}

// $links: array of [file, label, glyphicon]; $user: userlogin row
function ui_nav($links, $user, $roleLabel)
{
    $current = basename($_SERVER['SCRIPT_NAME']);
    $name = trim(($user['surname'] ?? '') . ' ' . ($user['othernames'] ?? ''));
    $initial = strtoupper(substr($name !== '' ? $name : 'U', 0, 1));

    echo '<nav class="appnav"><div class="nav-links">';
    foreach ($links as $l) {
        $active = ($current === $l[0]) ? ' active' : '';
        echo '<a class="' . trim($active) . '" href="' . ui_h($l[0]) . '"><span class="glyphicon glyphicon-' . ui_h($l[2]) . '"></span>' . ui_h($l[1]) . '</a>';
    }
    echo '</div><div class="who"><div class="avatar">' . ui_h($initial) . '</div>'
        . '<div><strong>' . ui_h($name) . '</strong><small>' . ui_h($roleLabel) . ' &middot; ' . ui_h($user['staffid'] ?? '') . '</small></div>'
        . '<a class="btn btn-ghost btn-sm" href="profile.php">Profile</a>'
        . '<a class="btn btn-danger btn-sm" href="logout.php">Logout</a></div></nav>';
}

function ui_status_pill($status)
{
    $s = trim((string) $status);
    if ($s === 'Completed') {
        return '<span class="pill ok">Completed</span>';
    }
    if ($s === '' || $s === 'Not Yet') {
        return '<span class="pill">New</span>';
    }
    return '<span class="pill warn">' . ui_h($s) . '</span>';
}
