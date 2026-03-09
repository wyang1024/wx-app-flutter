import 'package:flutter/material.dart';
import 'app_theme.dart';

enum CigaretteType { thick, medium, thin }

class CustomTobaccoPage extends StatefulWidget {
  const CustomTobaccoPage({Key? key}) : super(key: key);

  @override
  State<CustomTobaccoPage> createState() => _CustomTobaccoPageState();
}

class _CustomTobaccoPageState extends State<CustomTobaccoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  CigaretteType _selected = CigaretteType.thick;
  ImageProvider? _image;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _onSelectType(CigaretteType t) {
    setState(() => _selected = t);
  }

  void _onSave() {
    final name = _nameController.text.trim();
    final price = double.tryParse(_priceController.text) ?? 0.0;
    // TODO: persist data or call backing service
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已保存：$name  ¥${price.toStringAsFixed(2)}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.backgroundDark : AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('自定义烟草', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 4),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // image picker could be added here
                        },
                        child: Container(
                          width: 144,
                          height: 192,
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppTheme.primary.withOpacity(0.05)
                                : AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: AppTheme.primary.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: _image == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add_a_photo, size: 36, color: AppTheme.primary),
                                    SizedBox(height: 8),
                                    Text('上传烟盒图片', style: TextStyle(color: AppTheme.primary)),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(22),
                                  child: Image(image: _image!, fit: BoxFit.cover),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Name
                    const Text('烟草名称', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: '例如：中华（软）',
                        filled: true,
                        fillColor: isDark ? AppTheme.cardDark : AppTheme.cardLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Type
                    const Text('烟支类型', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _typeButton(CigaretteType.thick, '粗支'),
                        const SizedBox(width: 12),
                        _typeButton(CigaretteType.medium, '中支'),
                        const SizedBox(width: 12),
                        _typeButton(CigaretteType.thin, '细支'),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Price
                    const Text('价格 (元)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: isDark ? AppTheme.cardDark : AppTheme.cardLight,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Text('¥', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _priceController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: const InputDecoration(border: InputBorder.none, hintText: '0.00'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),

            // Save bar
            Container(
              padding: const EdgeInsets.all(12),
              color: isDark ? AppTheme.backgroundDark : AppTheme.backgroundLight,
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _onSave,
                    icon: const Icon(Icons.save, color: Colors.black),
                    label: const Text('保存并记录购买', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 6,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeButton(CigaretteType t, String label) {
    final selected = _selected == t;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onSelectType(t),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppTheme.primary.withOpacity(0.15) : (Theme.of(context).brightness == Brightness.dark ? AppTheme.cardDark : AppTheme.cardLight),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: selected ? AppTheme.primary : Colors.transparent, width: 2),
          ),
          child: Text(label, style: TextStyle(fontWeight: selected ? FontWeight.bold : FontWeight.w600, color: selected ? AppTheme.primary : (Theme.of(context).brightness == Brightness.dark ? AppTheme.textDark : AppTheme.textLight))),
        ),
      ),
    );
  }
}
