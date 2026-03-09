import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'models/tobacco_brand.dart';
import 'custom_tobacco_page.dart';

class RecordBuyingPage extends StatefulWidget {
  const RecordBuyingPage({super.key});

  @override
  State<RecordBuyingPage> createState() => _RecordBuyingPageState();
}

class _RecordBuyingPageState extends State<RecordBuyingPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '全部';

  final List<String> _categories = ['全部', '粗支', '中支', '细支'];

  final List<TobaccoBrand> _brands = [
    const TobaccoBrand(
      name: '利群',
      type: '中支',
      price: 36,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD4KleStzv-NeZf1Pm_eX9yNHvIXpHgB-Q3Fk81Ca-8Mr2d74HEGfmwQtMS5K5i4iXfM90iBAyauO1PhValfOeLE3MOVYDfRD1bs_lBtsmGcOciaOFaE-Ad9TOwaZzNbQxZj8yNTBNO0hempOl7xXH9CKsm7J3k4nJNFXmGQdkWWpdmZOU5jxnm47wv3j6Oib_Ox1CkKsZmS8HjeyOTxfZUCdSLll02F7h9E_6OPpXfmI2a9SfFuwMrkCMgzUZ7gvRfZyeBrmAnxXk',
      tag: '上次购买',
    ),
    const TobaccoBrand(
      name: '中华',
      type: '粗支',
      price: 65,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDr-CXjq5Y8YAqCHLAAtZ_J2TFCvGWnD_SDK1TkOc5yIjLaTLuYQS2uxN7FD_Hdam-KP4V2MivAb9tLFYwmvWTprXrsFdmcbAPSwqbOz2LJeGsh7F2gP4hfGZuNSf2awEgLr0CKPW9kp6UefjiLzP4921Pn3f3w-ag8Iax1DC7t_ifsC371IVoUD6F6Tsjhjnm3Hs0iOKNQm91ZofwuJxTzkjZqCccRKQuSFnGqvH8XkIVYMTbKfNTahrSWTuSAMzf7joHgOYJsh8I',
      tag: '常抽口粮',
    ),
    const TobaccoBrand(
      name: '黄鹤楼',
      type: '细支',
      price: 40,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD8bQ5hr08HD3ja1l-kPQ06ZMPB-ilTWn8q0sI9jl5hIZsExS3llnThMpS6laDMPF_vrKkbP5dLNPnHOpPv18y0XlClio8mzoAX9bSPLVYgaAN6u6yoXJqjw_0o23ClwqgazF_xjCULN22SY8-8eqpagLHSyw-DGVx8IGVKLtGr4eAT7ixjDIfGT0Y3mGkJnPV2xoa1L7ytL0SHhGvOoE7i6wM5TRPqeMtltPwuYqsimozd1O1pGQGK8KESWc7fgL0ro8emx--BEgQ',
    ),
    const TobaccoBrand(
      name: '芙蓉王',
      type: '粗支',
      price: 25,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD1JYndXltGMJupAd4ZvxptGSvnrSZjFLdppJUfp1CRTk9CSsFcY-QYaja3rO7jnGQUPNeyzDrAYPGqzu2FZ6ykvXAPTnYmkdE73yE2wSaBgNKMhOXrE5ySi3Ufc1OMdFOLk9mJAuXuVBY9pxms9MbfC9XwNi5XwOm-0oaspg47ydZfrSjaEspCaoJ4wCtgLGy1AhLHSjokN4GS49A0VjobTldp0YOUKLaEyVpvJGHaV4MJyhCjjP6NEh9qHfoUY046SLg8tUQus6c',
    ),
    const TobaccoBrand(
      name: '玉溪',
      type: '细支',
      price: 23,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCO3ZJ6JT-TVmGBQU1A5NiYNLTgyg6ZytXnnDartw1Su_dURttWdNCW3IISI2xccBPS_7KXBhEcJ-U1TCGjH_jhEnbu4Jd7Bz9ulRwoidIVvS3ueDB0Pfivtw91VmQRRBfcgJbydOfrI3jNSwJEEVmR6kLDLA6BP5m-iMlRX4tBWcpphtPTUqEFHDdLGZEiffjw2Yz7ufNCWKqodKVVQY0WoLY21YdAj9cxxWAdTfXA2-AiUWApJXc5Tfik5uFfm6iclIzoNP-fxmg',
    ),
    const TobaccoBrand(
      name: '云烟',
      type: '中支',
      price: 10,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDWPQpv4BFA5XYlhvVMKESspej0e_Phj1jcdlUEeEiBLwYL0Lz9FMM7ei68EiK8oufhWwOeQlwao2Y3b8ez_aYZTLSK8TR2FfcWzC6cAV7KpwGpNRxIXW3KJAo6J6rJe72Y7YO_y4Sz0xzGgPJKtR7d62rzBCEjBB0VsdTaMz99nlv4mFhz3II4ZGrvK-3S_nEMuTvD1JVTdwTkZbXEVNgEP66umU_GwKAnH4qSN2ZmYe76Fud-Lw0HsiCkmdvWmCan5dkmGo4lFyI',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '选择烟草品牌',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _buildSearchBar(isDark),
          _buildCategoryFilter(isDark),
          Expanded(
            child: _buildTobaccoList(isDark),
          ),
          _buildBottomButtons(isDark),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppTheme.primary.withOpacity(isDark ? 0.05 : 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
            hintText: '搜索烟草品牌',
            hintStyle: TextStyle(
              color: AppTheme.primary.withOpacity(0.7),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppTheme.primary,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildTobaccoList(bool isDark) {
    final filteredBrands = _brands.where((brand) {
      final matchesCategory = _selectedCategory == '全部' || brand.type == _selectedCategory;
      final matchesSearch = brand.name.toLowerCase().contains(_searchController.text.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredBrands.length,
      itemBuilder: (context, index) {
        return _TobaccoBrandItem(
          key: ValueKey(filteredBrands[index].name),
          brand: filteredBrands[index],
          isDark: isDark,
        );
      },
    );
  }

  Widget _buildCategoryFilter(bool isDark) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;
          return ChoiceChip(
            label: Text(
              category,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                  ? (isDark ? Colors.black : Colors.black)
                  : (isDark ? Colors.white70 : Colors.black87),
              ),
            ),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedCategory = category;
                });
              }
            },
            selectedColor: AppTheme.primary,
            backgroundColor: AppTheme.primary.withOpacity(isDark ? 0.05 : 0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide.none,
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }

  Widget _buildBottomButtons(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.backgroundDark : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ActionButton(
            label: '找不到？懒得找？自定义烟草',
            icon: Icons.add_circle,
            backgroundColor: AppTheme.primary.withOpacity(0.05),
            textColor: AppTheme.primary,
            borderColor: AppTheme.primary.withOpacity(0.3),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CustomTobaccoPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          _ActionButton(
            label: '记录买烟',
            icon: Icons.check_circle,
            backgroundColor: AppTheme.primary,
            textColor: Colors.black, // From design it looks like dark text on primary
            isBold: true,
            hasShadow: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _TobaccoBrandItem extends StatefulWidget {
  final TobaccoBrand brand;
  final bool isDark;

  const _TobaccoBrandItem({
    super.key,
    required this.brand,
    required this.isDark,
  });

  @override
  State<_TobaccoBrandItem> createState() => _TobaccoBrandItemState();
}

class _TobaccoBrandItemState extends State<_TobaccoBrandItem> {
  int _quantity = 1;
  bool _isCarton = false;
  late double _price;

  @override
  void initState() {
    super.initState();
    _price = widget.brand.price;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.brand.tag == '上次购买'; // Mimicking design's initial selection

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.isDark ? AppTheme.cardDark : AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? AppTheme.primary : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.brand.imageUrl,
                    width: 64,
                    height: 85,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 64,
                      height: 85,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.brand.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '[${widget.brand.type}]',
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.isDark ? Colors.white54 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            '¥',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 2),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: const TextStyle(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(text: _price.toStringAsFixed(0)),
                              onChanged: (value) {
                                _price = double.tryParse(value) ?? _price;
                              },
                            ),
                          ),
                          const Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Actions
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isCarton = !_isCarton;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.primary, width: 2),
                              color: _isCarton ? AppTheme.primary : Colors.transparent,
                            ),
                            child: _isCarton
                                ? const Center(
                                    child: Icon(Icons.circle, size: 8, color: Colors.white),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '1条',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: widget.isDark ? AppTheme.backgroundDark : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: widget.isDark ? Colors.white10 : Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_quantity > 1) {
                                setState(() {
                                  _quantity--;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove, size: 14),
                            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            width: 20,
                            child: Text(
                              _quantity.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            icon: const Icon(Icons.add, size: 14),
                            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                            padding: EdgeInsets.zero,
                            color: AppTheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.brand.tag != null)
            Positioned(
              top: -8,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.brand.tag == '上次购买' ? AppTheme.primary : Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.brand.tag == '上次购买' ? Icons.history : Icons.whatshot,
                      size: 10,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.brand.tag!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final bool isBold;
  final bool hasShadow;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.isBold = false,
    this.hasShadow = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
