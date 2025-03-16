import 'package:flutter/widgets.dart';
import 'package:interfaces/design_system/tokens/spacing/ds_spacing.dart';

/// Design System [Spacer].
///
/// Spacing used to structure the components, as well as create vertical rate and horizontal rate in the interfaces.
///
/// {@tool snippet}
/// ```
/// Column(
///   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
///   children: [
///     Text('Example of spacer'),
///     DsSpacer.md,
///     Row(
///       mainAxisAlignment: MainAxisAlignment.spaceBetween,
///       children: [
///         DsButton.secondary(
///           label: 'Secondary',
///           onPressed: () {},
///         ),
///         DsSpacer.xs,
///         DsButton.primary(
///           label: 'Primary',
///           onPressed: () {},
///         ),
///       ],
///     ),
///   ],
/// );
/// ```
/// {@end-tool}
///
/// See also:
///
/// * [Spacing]
///
class DsSpacer {
  /// * xs2 = 4.0,
  static const xs2 = SizedBox(width: DsSpacing.xs2, height: DsSpacing.xs2);

  /// * xs = 8.0,
  static const xs = SizedBox(width: DsSpacing.xs, height: DsSpacing.xs);

  /// * sm = 16.0,
  static const sm = SizedBox(width: DsSpacing.sm, height: DsSpacing.sm);

  /// * md = 24.0,
  static const md = SizedBox(width: DsSpacing.md, height: DsSpacing.md);

  /// * lg = 32.0,
  static const lg = SizedBox(width: DsSpacing.lg, height: DsSpacing.lg);

  /// * xl = 40.0,
  static const xl = SizedBox(width: DsSpacing.xl, height: DsSpacing.xl);

  /// * xl2 = 48.0,
  static const xl2 = SizedBox(width: DsSpacing.xl2, height: DsSpacing.xl2);

  /// * xl3 = 56.0,
  static const xl3 = SizedBox(width: DsSpacing.xl3, height: DsSpacing.xl3);

  /// * xl4 = 64.0.
  static const xl4 = SizedBox(width: DsSpacing.xl4, height: DsSpacing.xl4);

  /// * pill = Expanded().
  static const pill = Expanded(child: SizedBox());
}
