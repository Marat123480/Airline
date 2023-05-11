<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            rel="icon"
            href="https://s28477.pcdn.co/wp-content/uploads/2018/07/Chisinau_logo.png"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/static/css/style.css"/>
    <title>Chisinau Airport</title>
</head>
<body>
<!-- Header -->
<header class="header">
    <div class="header-container">
        <div class="header-section-1">
            <figure class="airport-logo">
                <img
                        src="/static/images/free-icon-rubber-duck-5444042.png"
                        height="55"
                        alt="Chisinau Airport Logo"
                />
            </figure>
            <div class="header-info">
                <a href="#">+373 22 817 817</a>
                <a href="#">+373 22 525 111</a>
                <a class="underline" href="#">KRYAIRLAINS</a>
            </div>
        </div>
        <div class="header-section-2">
            <ul class="main-menu">
                <#if user.email??>
                <li class="open-submenu">
                    <a class="menu-title" href="#">${user.name}</a>
                </li>
                <li class="open-submenu" style="cursor: pointer;">
                    <form action="/logout" method="post" style="cursor: pointer;">
                        <input type="submit" value="Exit" style="cursor: pointer;">
                    </form>
                </li>
                    <#if user.isAdmin()>
                        <li class="open-submenu">
                            <a class="menu-title" href="/admin">Admin panel</a>
                        </li>
                    </#if>
                <#else>
                    <li class="open-submenu">
                        <a class="menu-title" href="/login">Войти</a>
                    </li>
                </#if>
            </ul>
            </ul>
        </div>
    </div>
</header>

<!-- Main -->

<main>
    <!-- Hero Section -->

    <section id="hero">

        <div class="hero-container">
            <div class="bg-video">
                <figure id="video">
                    <img src="/static/images/poster.jpg" alt="Aeroportul Moldova">
                </figure>
            </div>
            <div class="hero-content">

                <h1>
                    FLIGHTS <br/>
                    MADE EASY
                </h1>

                <div class="weather">
                    <div class="weather-value">
                        <div class="weather-icon"></div>
                        <p>1°C <span>- 34°F</span></p>
                    </div>
                    <div class="weather-status">
                        <p>OVERCAST CLOUDS</p>
                    </div>
                </div>

                <div class="flights">
                    <ul class="flights-status" id="flight-status">
                        <li>
                            <a class="btn active" id="arrival" href="#sh-1"
                            >ARRIVALS <span class="arrival-arrow"> &#x2198;</span></a
                            >
                        </li>
                    </ul>
                    <div class="flights-search">
                        <div class="serach-logo">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>
                        <div class="search-text">
                            <input type="text" id="search" placeholder="SEARCH FLIGHTS"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Scheduale Section -->

    <section id="scheduale">
        <div class="scheduale-container">
            <div class="scheduale-table sh-1" id="sh-1">
                <div class="table-titles">
                    <div class="col col1">
                        <p>FLIGHT NO.</p>
                    </div>
                    <div class="col col2">
                        <p>DESTINATION</p>
                    </div>
                    <div class="col col3">
                        <p>SCH. TIME</p>
                    </div>
                    <div class="col col4">
                        <p>Airline</p>
                    </div>
                </div>
                <#list flights as flight>
                    <div class="table-content">
                        <div class="col col1">
                            <p>${flight.id}6</p>
                        </div>
                        <div class="col col2">
                            <p>${flight.country_from}</p>
                        </div>
                        <div class="col col3">
                            <p>${flight.departure_time.getDayOfMonth()} ${flight.departure_time.getMonth()} ${flight.departure_time.getYear()}</p>
                        </div>
                        <div class="col col4">
                            <p><a href="/airline/${flight.airline.id}">${flight.airline.getName()}</a></p>
                            <div class="airline-img">
                                <img style="height: 50px; width: 127px"
                                     src="images/${flight.airline.previewImageId}"
                                     alt="HISKY"
                                />
                            </div>
                        </div>
                    </div>
                <#else>
                    <h3>Товаров нет</h3>
                </#list>
            </div>
            <div class="all-flights">
                <p>ALL FLIGHTS</p>
            </div>
        </div>
    </section>

    <!-- News Section -->

    <section id="news">
        <div class="news-container">
            <div class="news-title">
                <h1>LATEST NEWS</h1>
            </div>
            <div class="news-grid">
                <div class="box grid-box-1">
                    <h2>COVID-19</h2>
                </div>
                <div class="box grid-box-2">
                    <span class="new-date">09 / 01 / 2023</span>
                    <h3>INVITAȚIE DE PARTICIPARE LA LICITAȚIE</h3>
                </div>
                <div class="box grid-box-3 black-box">
                    <span class="new-date">23 / 11 / 2022</span>
                    <h3 class="hide-overflow">
                        REZILIEREA ILEGALĂ A CONTRACTULUI DE CONCESIUNE COSTĂ STATUL
                        PESTE 90 DE MILIOANE DE EURO
                    </h3>
                    <p class="hide-overflow">
                        Avia Invest afirmă că decizia Curții de Apel este ilegală și va
                        fi atacată necondiționat la Curtea Supremă de Justiție.
                    </p>
                </div>
                <div class="box grid-box-4 white-box">
                    <span class="new-date">21 / 11 / 2022</span>
                    <h3 class="hide-overflow">"ATAC RAIDER ÎMPORTIVA AVIA INVEST"</h3>
                </div>
                <div class="box grid-box-5 white-box">
                    <span class="new-date">14 / 11 / 2022</span>
                    <h3 class="hide-overflow">
                        ACȚIONARII AVIA INVEST AU ATACAT REPUBLICA MOLDOVA LA CURTEA DE
                        APEL A SUEDIEI
                    </h3>
                </div>
                <div class="box grid-box-6 black-box">
                    <span class="new-date">07 / 09 /2022</span>
                    <h3>SE SISTEAZĂ ACTIVITATEA SĂLII VIP</h3>
                    <p class="hide-overflow">Please release</p>
                </div>
                <div class="box grid-box-7 white-box">
                    <span class="new-date">06 / 09 / 2022</span>
                    <h3 class="hide-overflow">
                        15 ZBORURI DIRECTE REDESCHISE DIN AEROPORTUL INTERNAȚIONAL
                        CHIȘINĂU.
                    </h3>
                </div>
                <div class="box grid-box-8 black-box">
                    <span class="new-date">04 / 08 / 2022</span>
                    <h3 class="hide-overflow">
                        DECIZIA PROCESUALĂ DE A SCOATE DE PE ROL CEREREA ESTE INTERIMARĂ
                        ȘI VA FI ATACATĂ LA O INSTANȚĂ
                    </h3>
                    <p class="hide-overflow">
                        Decizia procesuală de a scoate de pe rol cererea este interimară
                        și va fi atacată la o instanță superioară.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Discover Section -->

    <section id="discover">
        <div class="discover-container">
            <div class="discover-title">
                <h1>DISCOVER</h1>
            </div>
            <div class="discover-grid">
                <div class="disc-box disc-box-1"></div>
                <div class="disc-box disc-box-2">
                    <div class="table-name">
                        <h4>CURRENCY CONVERTER</h4>
                    </div>
                    <table>
                        <tbody>
                        <tr>
                            <td class="currency-name">MDL</td>
                            <td class="currency-value">2061.00</td>
                            <td class="empty-2"></td>
                        </tr>
                        <tr>
                            <td class="currency-name">EUR</td>
                            <td class="currency-value g-value">100</td>
                            <td class="currency-rate">20.61</td>
                        </tr>
                        <tr>
                            <td class="currency-name">USD</td>
                            <td class="currency-value">108.82</td>
                            <td class="currency-rate">18.94</td>
                        </tr>
                        <tr>
                            <td class="currency-name">RUB</td>
                            <td class="currency-value">7360.71</td>
                            <td class="currency-rate">0.28</td>
                        </tr>
                        <tr>
                            <td class="currency-name">RON</td>
                            <td class="currency-value">491.89</td>
                            <td class="currency-rate">4.19</td>
                        </tr>
                        <tr>
                            <td class="currency-name">UAH</td>
                            <td class="currency-value">4041.18</td>
                            <td class="currency-rate">0.51</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="bank-md">
                        <p>*National Bank of Moldova</p>
                    </div>
                </div>
                <div class="disc-box disc-box-3">
                    <div class="box-3-icon">
                        <img src="/static/images/partner.png" alt="Become Partner"/>
                    </div>
                    <h3>BECOME<br/>OUR PARTNER</h3>
                    <p>LEARN MORE</p>
                </div>
                <div class="disc-box disc-box-4">
                    <div class="box-4-icon">
                        <img src="/static/images/tour.png" alt="Tour"/>
                    </div>
                    <div class="box-content">
                        <h3>VIRTUAL TOUR</h3>
                        <p>Explore the airport Chisinau area</p>
                    </div>
                </div>
                <div class="disc-box disc-box-5">
                    <h3>FULL RANGE OF DUTYFREE PRODUCTS ONLINE</h3>
                    <p>LEARN MORE</p>
                </div>
                <div class="disc-box disc-box-6">
                    <div class="box-6-icon">
                        <img src="/static/images/flight.png" alt="Flight Radar"/>
                    </div>
                    <div class="box-content">
                        <h3>FLIGHT RADAR</h3>
                        <p>Observe your flight live in real time</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- FOOTER -->

<footer id="footer">
    <div class="footer-container">
        <div class="airport-info">
            <div class="airport-logoo">
                <figure>
                    <img
                            src="/static/images/Chisinau_logo-removebg-preview-PhotoRoom.png"
                            alt="Airport Moldova Logo"
                    />
                </figure>
                <h2>CHISINAU<br/>INTERNATIONAL<br/>AIRPORT</h2>
            </div>
            <hr/>
            <div class="air-contact">
                <a href="#">+373 22 817 817</a>
                <a href="#">+373 22 525 111</a>
                <p>
                    DACIA BOULEVARD 80/3, CHISINAU 2026
                    <br/>
                    REPUBLIC OF MOLDOVA
                    <br/>
                    HOTLINE@AIRPORT.MD
                </p>
            </div>
            <div class="air-socials">
                <i class="fa-brands fa-facebook-f"></i>
                <i class="fa-brands fa-youtube"></i>
                <i class="fa-brands fa-instagram"></i>
                <i class="fa-brands fa-telegram"></i>
            </div>
            <div class="air-copyright">
                <p>
                    &copy; 2021 Chisinau International Airport
                    <br/>
                    Design by amigo.studio
                    <br/>
                    Engine by
                    <a href="#">www.sonacom.net</a>
                </p>
            </div>
        </div>
        <div class="airport-links">
            <div class="air-link">
                <div class="air-link-title">
                    <h3>PASSENGER</h3>
                </div>
                <ul class="footer-menu">
                    <li>
                        <a href="#">COVID-19 INFORMATION</a>
                    </li>
                    <li>
                        <a href="#">ONLINE PANEL</a>
                    </li>
                    <li>
                        <a href="#">VIRTUAL TOUR</a>
                    </li>
                    <li>
                        <a href="#">NEWS AND UPDATES</a>
                    </li>
                    <li>
                        <a href="#">VIDEO GALLERY</a>
                    </li>
                </ul>
            </div>
            <div class="air-link fm">
                <div class="air-link-title">
                    <h3>SERVICES</h3>
                </div>
                <ul class="footer-menu">
                    <li>
                        <a href="#">PARKING</a>
                    </li>
                    <li>
                        <a href="#">VIP LOUNGE DISCOUNTS</a>
                    </li>
                    <li>
                        <a href="#">CONFERENCE ROOM</a>
                    </li>
                    <li>
                        <a href="#">SERVICII VIP LOUNGE</a>
                    </li>
                    <li>
                        <a href="#">VIP CAR SERVICE</a>
                    </li>
                    <li>
                        <a href="#">ELECTRONIC LIBRARY</a>
                    </li>
                    <li>
                        <a href="#">BUSINESS LOUNGE</a>
                    </li>
                    <li>
                        <a href="#">OTHER SERVICES</a>
                    </li>
                </ul>
            </div>
            <div class="air-link fm">
                <div class="air-link-title">
                    <h3>ABOUT US</h3>
                </div>
                <ul class="footer-menu">
                    <li>
                        <a href="#">CONTACT FORM</a>
                    </li>
                    <li>
                        <a href="#">AIRPORT HISTORY</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>


</body>
</html>
