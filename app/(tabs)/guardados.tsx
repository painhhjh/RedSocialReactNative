import { View, Text } from 'react-native'
import React from 'react'
import { styles } from '../../styles/auth.styles'

export default function guardados() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}> Página de guardados</Text>
    </View>
  )
}