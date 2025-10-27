/// Static data for CollabVerse: Domain → Roles mapping
class DomainRoleData {
  static const domainRoleMap = {
    "Musik": [
      "Vokalis/Penyanyi",
      "Gitaris",
      "Bassist",
      "Drummer",
      "Pianis/Keyboardist",
      "Penulis Lagu/Songwriter",
      "Produser Musik",
      "DJ/Electronic Musician",
      "Sound Engineer",
      "Penata Musik/Music Arranger",
    ],
    "Film/Videografi": [
      "Sutradara",
      "Penulis Naskah",
      "Kameramen/Videografer",
      "Editor Video",
      "Aktor/Aktris",
      "Penata Suara",
      "Penata Artistik/Art Director",
      "Penata Cahaya/Lighting Director",
      "Colorist",
      "Animator/Motion Graphic Artist",
    ],
    "Teater/Drama": [
      "Aktor/Aktris",
      "Sutradara Panggung",
      "Penulis Naskah",
      "Penata Artistik",
      "Penata Musik/Pengiring",
      "Penata Panggung",
      "Penata Busana",
      "Stage Manager",
      "Pelatih Akting/Acting Coach",
    ],
    "Tari/Dance": [
      "Penari",
      "Koreografer",
      "Pelatih Tari",
      "Penata Musik Tari",
      "Penata Kostum Tari",
      "Stage Performer",
      "Dancer Content Creator",
    ],
    "Pertunjukan Tradisional": [
      "Dalang",
      "Penabuh Gamelan",
      "Penari Tradisional",
      "Pemusik Tradisional",
      "Pengrawit/Penata Iringan",
      "Penata Kostum Tradisional",
      "Pemeran Wayang/Ketoprak/Ludruk",
    ],
    "Fotografi": [
      "Fotografer",
      "Asisten Fotografer",
      "Photo Editor/Retoucher",
      "Model",
      "Fashion Stylist",
      "Lighting Assistant",
      "Visual Storyteller",
    ],
    "Visual/Desain": [
      "Desainer Grafis",
      "Ilustrator",
      "Desainer UI/UX",
      "Desainer Produk",
      "Desainer Logo/Branding",
      "Art Director",
      "Concept Artist",
      "Motion Designer",
    ],
    "Literasi/Penulis": [
      "Penulis Fiksi/Non-Fiksi",
      "Penulis Naskah",
      "Penyair",
      "Editor",
      "Proofreader",
      "Copywriter",
      "Content Writer/Blogger",
    ],
    "MC/Publik Speaker": [
      "MC/Master of Ceremony",
      "Host/Presenter",
      "Moderator",
      "Stand-up Comedian",
      "Storyteller",
      "Public Speaking Coach",
      "Motivator",
    ],
    "Multimedia": [
      "Animator 2D/3D",
      "Motion Graphic Designer",
      "Editor Video",
      "Audio Engineer",
      "Desainer Interaktif",
      "Visual FX Artist",
      "Content Creator Multimedia",
    ],
    "Video Game": [
      "Game Designer",
      "Game Developer/Programmer",
      "Game Artist/Illustrator",
      "Game Writer/Story Designer",
      "UI/UX Game Designer",
      "Sound Designer/Composer",
      "QA Tester",
    ],
    "Lainnya": [
      "Influencer/Content Creator",
      "Podcaster",
      "Voice Over Artist",
      "Event Organizer",
      "Komunitas Kreatif",
      "Kurator Seni",
      "Mentor/Coach Kreatif",
    ],
  };

  /// Mengembalikan seluruh daftar domain (key dari [domainRoleMap]).
  static List<String> get domains => domainRoleMap.keys.toList();

  /// Mengembalikan seluruh role dari semua domain dalam satu list.
  static List<String> get roles => domainRoleMap.values.expand((roles) => roles).toList();

  /// Mengembalikan daftar role berdasarkan [domain] tertentu.
  /// Jika domain tidak ditemukan, akan mengembalikan list kosong.
  static List<String> getRolesByDomain(String domain) => domainRoleMap[domain] ?? [];
}
